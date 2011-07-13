(function() {
  var methods = ['get', 'put', 'post', 'delete'],
      actions = ['index', 'create', 'new', 'edit', 'show', 'update', 'destroy'];
      route_discriptions = {
        plural: [['get', ''], ['post', ''], ['get', '/new'], ['get', '/:id/edit'], ['get', '/:id'], ['put', '/:id'], ['delete', '/:id']],
        singular: [null, ['post', ''], ['get', '/new'], ['get', '/edit'], ['get', ''], ['put', ''], ['delete', '']]
      };

  function parseUrl(url) {
    var urlParts = url.match(/^((http[s]?|ftp):\/\/)?(((.+)@)?([^:\/\?#\s]+)(:(\d+))?)?(\/?[^\?#\.]+)?(\.([^\?#]+))?(\?([^#]?))?(#(.*))?$/i) || [];
    var pathParts = (urlParts[9]) ? urlParts[9].match(/(\/.*)\/+(\w+)$/i) || [] : [];
    return {scheme: urlParts[2], credentials: urlParts[5], host: urlParts[6], port: urlParts[8], path: urlParts[9], action: pathParts[2] || '', format: urlParts[11], query: urlParts[13], hash: urlParts[15]};
  }

  function observeAjax(original, url) {
    var method = (this.options.parameters['_method'] || this.options.method || 'post').toLowerCase(),
        urlParts = parseUrl(url),
        path = urlParts.path,
        action = urlParts.action,
        handled, proceeded;

    var proceed = function(options) {
      proceeded = true;
      this.proceeded = true;
      this.options = Object.extend(this.options, options || {});
      return original(url);
    }.bind(this); // TODO: remove prototype dependency

    for (var mapping in context.resources) {
      var resource = context.resources[mapping],
          actions = resource.__actions__,
          pathvars = resource.__pathvars__,
          singular = resource.__singular__,
          f, matches, result, vars = {};

      if (!(matches = path && path.match(resource.__path__))) continue;

      var mAction = matches[matches.length - 2], mIdOrAction = matches[matches.length - 3];
      switch (method) {
        case 'get':
          if (!(f = actions['get'][action])) {
            if (!mIdOrAction) action = '';
            switch (action) {
              case '': f = singular ? actions['show'] : actions['index']; break;
              case 'new': f = actions['new']; break;
              case 'edit': f = actions['edit']; break;
              default: f = (!mAction) ? actions['show'] : false;
            }
          }
          break;
        case 'put': f = actions['put'][action] || ((!mAction) ? actions['update'] : false); break;
        case 'post': f = actions['post'][action] || ((!mIdOrAction) ? actions['create'] : false); break;
        case 'delete': f = actions['delete'][action] || ((!mAction) ? actions['destroy'] : false); break;
      }

      if (f) {
        for (var i = 0; i < pathvars.length; i++) vars[pathvars[i]] = matches[i + 1];
        result = f(proceed, vars, urlParts);
      }
      if (result !== false && !proceeded) proceed(result);
      handled = true;
    }
    if (!handled) return original(url);
  }

  function createResource(path, singular) {
    if (this.resources[path]) return this.resources[path];
    var i, errorMessage = "That action already exists on the '" + path + "' resource. Try removing it first.";
    return this.resources[path] = {
      __path__: new RegExp('^' + (path[0] == '/' ? path : '/' + path).replace(/:\w+/ig, '(\\w+)') + '/?(\\w+)?/?(\\w+)?/?($|\\?|\\.|#)', 'i'),
      __pathvars__: (path.match(/:(\w+)/ig) || []).join('|').replace(/:/g, '').split('|'),
      __actions__: {},
      __singular__: singular,
      __add__: function(action, callback) {
        if (typeof (action) == 'string') {
          if (this.__actions__[action]) throw(errorMessage);
          this.__actions__[action] = callback;
        } else {
          if (this.__actions__[action[0]][action[1]]) throw(errorMessage);
          this.__actions__[action[0]][action[1]] = callback;
        }
      },
      add: function(actionOrActions, callback, method) {
        if (typeof (actionOrActions) == 'string' && typeof (callback) == 'function') {
          var action = actionOrActions.split(':');
          if (action.length > 1) this.__add__([action[0], action[1]], callback);
          else this.__add__(action[0], callback);
        } else if (typeof actionOrActions == 'object') {
          for (i = 0; i < methods.length; i++) { this.__actions__[methods[i]] = actionOrActions[methods[i]] || this.__actions__[methods[i]] || {} }
          for (i = 0; i < actions.length; i++) { this.__actions__[actions[i]] = actionOrActions[actions[i]] || this.__actions__[actions[i]] }
        } else {
          throw('To add a resource you must provide: action or method:action, callback function - or - an object of actions/methods');
        }
        return this;
      },
      remove: function(action) {
        action = action.split(':');
        return (action.length > 1) ? delete this.__actions__[action[0]][action[1]] : delete this.__actions__[action[0]];
      }
    };
  }

  // TODO: add support for jQuery, mootools, YUI, Dojo, and ??
  Ajax.Request.prototype.request = Ajax.Request.prototype.request.wrap(observeAjax);

  // TODO: let's have a way to accomplish adding nicely to a window.Rails variable
  var context = window.Rails = {
    resources: {},
    resource: function(path, singular, actions) { return createResource.call(this, path, singular).add(actions || {}); },
    routes: function() {
      var routes = [], route = '', i, description, singular, name;
      for (var resource in this.resources) {
        singular = this.resources[resource].__singular__;
        name = resource.substr(resource.lastIndexOf('/') + 1);
        for (i = 0; i < methods.length; i++) {
          for (var action in this.resources[resource].__actions__[methods[i]]) {
            routes.push(resource + '/' + action + ' ' + methods[i].toUpperCase() + ' => ' + name + '#' + action);
          }
        }
        for (i = singular ? 1 : 0; i < actions.length; i++) {
          description = route_discriptions[singular ? 'singular' : 'plural'][i];
          route = resource + description[1] + ' ' + description[0].toUpperCase() + ' => ' + name + '#' + actions[i];
          if (this.resources[resource].__actions__[actions[i]]) routes.push(route);
        }
      }
      return routes;
    }
  };
})();