/**
 * Tim Coppieters
 * september 2013
 */

console.log("loading " + module.id);

function Model(attrs) {
  var model = this;
  if (typeof attrs !== 'undefined') {
    Object.keys(attrs).forEach(function (attr) {
      model[attr] = attrs[attr];
    });
  }
  if (typeof this.initialize === 'function')
    this.initialize();
}

Model.extend = function (table, attrNames, protoProps, staticProps) {
  var parent = this;
  var child;

  // The constructor function for the new subclass is either defined by you
  // (the "constructor" property in your `extend` definition), or defaulted
  // by us to simply call the parent's constructor.
  //  if (protoProps && (typeof protoProps.constructor !== 'undefined')) {
  //    child = protoProps.constructor;
  //  } else {
  child = function (){ return parent.apply(this, arguments); };
  //  }

  // Add static model properties to the constructor function
  Object.keys(parent).forEach(function (prop) {
    child[prop] = parent[prop];
  });

  // Add static properties to the constructor function, if supplied.
  if (staticProps)
    Object.keys(staticProps).forEach(function (prop) {
      child[prop] = staticProps[prop];
    });

  // Set prototype chain to inherit from parent
  child.prototype = Object.create(parent.prototype);

  // Add database info to the child prototype and constructor
  child.prototype.table     = table;
  child.prototype.attrNames = attrNames;

  child.table     = table;
  child.attrNames = attrNames;

  // Add supplied prototype properties (instance properties) to the subclass
  if (protoProps)
    Object.keys(protoProps).forEach(function (prop) {
      child.prototype[prop] = protoProps[prop];
    });

  // Set a convenience property in case the parent's prototype is needed
  // later.
  child.__super__ = parent.prototype;

  child.__parent__ = parent;

  return child;
};

/* Constructor Methods */
/* ------------------- */


//
// All
//
Model.all = function (controller, finish) {
  var Class = this;
  var query = " SELECT * FROM " + this.table;
  controller.query(query, function (err, rows) {
    if (err)
      return finish(err);

    finish(err, rows.map(function (row) {
      return new Class(row);
    }));
  });
};

//
// Build
// Creates an unsaved model and takes ALL properties (even if they are
// not columns from the model).
Model.build = function (attr) {
  return new this(attr);
};


//
// Create
// Creates and saves a new model. Also takes all properties
Model.create = function (controller, attr, finish) {
  var model;
  if (typeof attr === 'function') {
    console.log('attr fuct');
    model = new this();
    model.save(controller, attr);
  } else {
    model = new this(attr);
    model.save(controller, finish);
  }
};


//
// getById
//
Model.getById = function (controller, id, finish) {
  var Class = this;
  var query = " SELECT * FROM " + this.table +
              " WHERE id = " + id;
  controller.query(query, function (err, result) {
    if (err)
      return finish(err);

    if (result.length > 0)
      return finish(err, new Class(result[0]));

    finish(err);
  });
};

//
// getBy
//
Model.getBy = function (controller, filters, finish) {
  var Class   = this;
  var sets    = createSets(filters);
  var fields  = Object.keys(filters).map(function (key) { return filters[key]; });
  var query   = " SELECT * FROM " + this.table +
                " WHERE " + sets;
  controller.query(query, fields, function (err, result) {
    if (err)
      return finish(err);

    if (result.length > 0) {
      var models = result.map(function (row) { return new Class(row); });
      return finish(err, models);
    }

    finish(err);
  });
};

function createSets(filters) {
  return Object.keys(filters).map(function (column) {
    return column + " = ? ";
  }).join("AND ");
}

function fieldMarks(columns) {
  return columns.forEach(function (column) {
     return "?";
  }).join(', ');
}


/* Prototype Methods */
/* ----------------- */

//
// Save
//
Model.prototype.save = function (controller, finish) {
  var query;
  var model  = this;

  var table  = this.table;
  var columns = this.attrNames.join(', ');
  var values  = this.values().map(function (val) {
    return controller.escape(val);
  }).join(', ');

  // Insert new record
  if ((typeof this.id === "undefined") || (this.id === 0)) {
    console.log("inserting " + " in " + table);
    query = "insert into " + table + "(" + columns + ")" +
      "values (" + values + ")";

    controller.query(query, function(err, result) {
      if (err && (typeof finish === "function") )
        return finish(err);

      model.id = result.insertId;
      console.log("inserted " + model.id + " in " + table);
      if (typeof finish === "function")
        finish(undefined, model);
    });

    // Update existing record
  } else {
    console.log("updating " + this.id + " of " + this.table);
    var sets = this.attrNames.map(function (column) {
      var val = controller.escape(model[column]);
      return column + " = " + val;
    }).join(', ');
    query = " UPDATE " + table + " SET " + sets +
            " WHERE id = " + controller.escape(this.id);
    controller.query(query, function (err, result) {
      if (err)
        return finish(err);
      finish(err, model);
    });
  }
};

//
// Delete
//
Model.prototype.delete = function (controller, finish) {
  var query;
  var table  = this.table;
  var escape = controller.escape;
  var id     = controller.escape(this.id);

  if ((typeof this.id !== "undefined") && (this.id !== 0)) {

    console.log("deleting " + this.id + " from " + table);
    query = " DELETE FROM " + table +
            " WHERE id = " + id;
    controller.query(query, finish);
  } else {
    if (typeof finish === "function")
      finish(undefined, false);
  }
};

//
// Values
// Returns the values of the fields
Model.prototype.values = function () {
  var model = this;
  return this.attrNames.map(function (attr) {
    return model[attr];
  });
};


//
// fromRecord
// Updates the model from given record, taking only the properties
// that are actual columns of this model.
// Uses idAttr as the name of the property to take as id, defaults to 'id'.
// ! Use this to scrape models from join select results !
Model.prototype.fromRecord = function (record, idAttr) {
  var model = this;
  if (typeof idAttr === 'undefined')
    idAttr = 'id';
  model.id = record[idAttr];
  model.attrNames.forEach(function (attrName) {
    model[attrName] = record[attrName];
  });
  return model;
};

module.exports = Model;