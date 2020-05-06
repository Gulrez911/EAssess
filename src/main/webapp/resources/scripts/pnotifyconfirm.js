var _typeof = typeof Symbol === "function" && typeof Symbol.iterator === "symbol" ? function (obj) { return typeof obj; } : function (obj) { return obj && typeof Symbol === "function" && obj.constructor === Symbol && obj !== Symbol.prototype ? "symbol" : typeof obj; };

var _extends = Object.assign || function (target) { for (var i = 1; i < arguments.length; i++) { var source = arguments[i]; for (var key in source) { if (Object.prototype.hasOwnProperty.call(source, key)) { target[key] = source[key]; } } } return target; };

/* src/PNotifyConfirm.html generated by Svelte v2.16.1 */
var PNotifyConfirm = function (PNotify) {
	"use strict";

	PNotify = PNotify && PNotify.__esModule ? PNotify["default"] : PNotify;

	function data() {
		return _extends({
			'_notice': null, // The PNotify notice.
			'_options': {} // The options for the notice.
		}, PNotify.modules.Confirm.defaults);
	};

	var methods = {
		initModule: function initModule(options) {
			this.set(options);
		},
		afterOpen: function afterOpen() {
			if (this.get().prompt && this.get().focus !== false) {
				if (this.get().promptMultiLine) {
					this.refs.promptMulti.focus();
				} else {
					this.refs.promptSingle.focus();
				}
			} else if (this.get().confirm && (this.get().focus === true || this.get().focus === null && this.get()._options.stack.modal)) {
				var buttons = this.get().buttons;
				if (buttons.length) {
					var i = buttons.length - 1;
					while (i >= 0) {
						if (buttons[i].promptTrigger) {
							break;
						}
						i--;
					}
					this.refs.buttons.children[i].focus();
				}
			}
		},
		handleClick: function handleClick(button, event) {
			if (button.click) {
				button.click(this.get()._notice, this.get().prompt ? this.get().promptValue : null, event);
			}
		},
		handleKeyPress: function handleKeyPress(event) {
			if (event.keyCode === 13 && !event.shiftKey) {
				event.preventDefault();

				var _get = this.get(),
				    buttons = _get.buttons;

				for (var i = 0; i < buttons.length; i++) {
					if (buttons[i].promptTrigger && buttons[i].click) {
						buttons[i].click(this.get()._notice, this.get().prompt ? this.get().promptValue : null, event);
					}
				}
			}
		}
	};

	function oncreate() {
		this.fire('init', { module: this });
	};

	function setup(Component) {
		Component.key = 'Confirm';

		Component.defaults = {
			// Make a confirmation box.
			confirm: false,
			// Make a prompt.
			prompt: false,
			// Classes to add to the input element of the prompt.
			promptClass: '',
			// The value of the prompt.
			promptValue: '',
			// Whether the prompt should accept multiple lines of text.
			promptMultiLine: false,
			// For confirmation boxes, true means the first button or the button with promptTrigger will be focused, and null means focus will change only for modal notices. For prompts, true or null means focus the prompt. When false, focus will not change.
			focus: null,
			// Where to align the buttons. (flex-start, center, flex-end, space-around, space-between)
			align: 'flex-end',
			// The buttons to display, and their callbacks.
			buttons: [{
				text: 'Ok',
				textTrusted: false,
				addClass: '',
				primary: true,
				// Whether to trigger this button when the user hits enter in a single line prompt. Also, focus the button if it is a modal prompt.
				promptTrigger: true,
				click: function click(notice, value) {
					notice.close();
					notice.fire('pnotify.confirm', { notice: notice, value: value });
				}
			}, {
				text: 'Cancel',
				textTrusted: false,
				addClass: '',
				click: function click(notice) {
					notice.close();
					notice.fire('pnotify.cancel', { notice: notice });
				}
			}]
		};

		// Register the module with PNotify.
		PNotify.modules.Confirm = Component;
		// Append this module to the container.
		PNotify.modulesAppendContainer.push(Component);

		// Add button styles to styling objects.
		_extends(PNotify.styling.brighttheme, {
			actionBar: '',
			promptBar: '',
			btn: '',
			btnPrimary: 'brighttheme-primary',
			input: ''
		});
		_extends(PNotify.styling.bootstrap3, {
			actionBar: 'ui-pnotify-confirm-ml',
			promptBar: 'ui-pnotify-confirm-ml',
			btn: 'btn btn-default ui-pnotify-confirm-mx-1',
			btnPrimary: 'btn btn-default ui-pnotify-confirm-mx-1 btn-primary',
			input: 'form-control'
		});
		_extends(PNotify.styling.bootstrap4, {
			actionBar: 'ui-pnotify-confirm-ml',
			promptBar: 'ui-pnotify-confirm-ml',
			btn: 'btn btn-secondary mx-1',
			btnPrimary: 'btn btn-primary mx-1',
			input: 'form-control'
		});
		if (!PNotify.styling.material) {
			PNotify.styling.material = {};
		}
		_extends(PNotify.styling.material, {
			actionBar: '',
			promptBar: '',
			btn: '',
			btnPrimary: 'ui-pnotify-material-primary',
			input: ''
		});
	};

	function add_css() {
		var style = createElement("style");
		style.id = 'svelte-1y9suua-style';
		style.textContent = ".ui-pnotify-action-bar.svelte-1y9suua,.ui-pnotify-prompt-bar.svelte-1y9suua{margin-top:5px;clear:both}.ui-pnotify-action-bar.svelte-1y9suua{display:flex;flex-wrap:wrap;justify-content:flex-end}.ui-pnotify-prompt-input.svelte-1y9suua{margin-bottom:5px;display:block;width:100%}.ui-pnotify-confirm-mx-1.svelte-1y9suua{margin:0 5px}.ui-pnotify.ui-pnotify-with-icon .ui-pnotify-confirm-ml.svelte-1y9suua{margin-left:24px}[dir=rtl] .ui-pnotify.ui-pnotify-with-icon .ui-pnotify-confirm-ml.svelte-1y9suua{margin-right:24px;margin-left:0}";
		append(document.head, style);
	}

	function click_handler(event) {
		var _svelte = this._svelte,
		    component = _svelte.component,
		    ctx = _svelte.ctx;


		component.handleClick(ctx.button, event);
	}

	function get_each_context(ctx, list, i) {
		var child_ctx = Object.create(ctx);
		child_ctx.button = list[i];
		return child_ctx;
	}

	function create_main_fragment(component, ctx) {
		var if_block_anchor;

		var if_block = (ctx.confirm || ctx.prompt) && create_if_block(component, ctx);

		return {
			c: function c() {
				if (if_block) if_block.c();
				if_block_anchor = createComment();
			},
			m: function m(target, anchor) {
				if (if_block) if_block.m(target, anchor);
				insert(target, if_block_anchor, anchor);
			},
			p: function p(changed, ctx) {
				if (ctx.confirm || ctx.prompt) {
					if (if_block) {
						if_block.p(changed, ctx);
					} else {
						if_block = create_if_block(component, ctx);
						if_block.c();
						if_block.m(if_block_anchor.parentNode, if_block_anchor);
					}
				} else if (if_block) {
					if_block.d(1);
					if_block = null;
				}
			},
			d: function d(detach) {
				if (if_block) if_block.d(detach);
				if (detach) {
					detachNode(if_block_anchor);
				}
			}
		};
	}

	// (1:0) {#if confirm || prompt}
	function create_if_block(component, ctx) {
		var div1, text, div0, div0_class_value;

		var if_block = ctx.prompt && create_if_block_2(component, ctx);

		var each_value = ctx.buttons;

		var each_blocks = [];

		for (var i = 0; i < each_value.length; i += 1) {
			each_blocks[i] = create_each_block(component, get_each_context(ctx, each_value, i));
		}

		return {
			c: function c() {
				div1 = createElement("div");
				if (if_block) if_block.c();
				text = createText("\n    ");
				div0 = createElement("div");

				for (var i = 0; i < each_blocks.length; i += 1) {
					each_blocks[i].c();
				}
				div0.className = div0_class_value = "\n          ui-pnotify-action-bar\n          " + (ctx._notice.get()._styles.actionBar ? ctx._notice.get()._styles.actionBar : '') + "\n          " + (ctx._notice.get()._styles.text ? ctx._notice.get()._styles.text : '') + "\n        " + " svelte-1y9suua";
				setStyle(div0, "justify-content", ctx.align);
				div1.className = "ui-pnotify-confirm";
			},
			m: function m(target, anchor) {
				insert(target, div1, anchor);
				if (if_block) if_block.m(div1, null);
				append(div1, text);
				append(div1, div0);

				for (var i = 0; i < each_blocks.length; i += 1) {
					each_blocks[i].m(div0, null);
				}

				component.refs.buttons = div0;
			},
			p: function p(changed, ctx) {
				if (ctx.prompt) {
					if (if_block) {
						if_block.p(changed, ctx);
					} else {
						if_block = create_if_block_2(component, ctx);
						if_block.c();
						if_block.m(div1, text);
					}
				} else if (if_block) {
					if_block.d(1);
					if_block = null;
				}

				if (changed.buttons || changed._notice) {
					each_value = ctx.buttons;

					for (var i = 0; i < each_value.length; i += 1) {
						var child_ctx = get_each_context(ctx, each_value, i);

						if (each_blocks[i]) {
							each_blocks[i].p(changed, child_ctx);
						} else {
							each_blocks[i] = create_each_block(component, child_ctx);
							each_blocks[i].c();
							each_blocks[i].m(div0, null);
						}
					}

					for (; i < each_blocks.length; i += 1) {
						each_blocks[i].d(1);
					}
					each_blocks.length = each_value.length;
				}

				if (changed._notice && div0_class_value !== (div0_class_value = "\n          ui-pnotify-action-bar\n          " + (ctx._notice.get()._styles.actionBar ? ctx._notice.get()._styles.actionBar : '') + "\n          " + (ctx._notice.get()._styles.text ? ctx._notice.get()._styles.text : '') + "\n        " + " svelte-1y9suua")) {
					div0.className = div0_class_value;
				}

				if (changed.align) {
					setStyle(div0, "justify-content", ctx.align);
				}
			},
			d: function d(detach) {
				if (detach) {
					detachNode(div1);
				}

				if (if_block) if_block.d();

				destroyEach(each_blocks, detach);

				if (component.refs.buttons === div0) component.refs.buttons = null;
			}
		};
	}

	// (3:4) {#if prompt}
	function create_if_block_2(component, ctx) {
		var div, div_class_value;

		function select_block_type(ctx) {
			if (ctx.promptMultiLine) return create_if_block_3;
			return create_else_block_1;
		}

		var current_block_type = select_block_type(ctx);
		var if_block = current_block_type(component, ctx);

		return {
			c: function c() {
				div = createElement("div");
				if_block.c();
				div.className = div_class_value = "\n            ui-pnotify-prompt-bar\n            " + (ctx._notice.get()._styles.promptBar ? ctx._notice.get()._styles.promptBar : '') + "\n            " + (ctx._notice.get()._styles.text ? ctx._notice.get()._styles.text : '') + "\n          " + " svelte-1y9suua";
			},
			m: function m(target, anchor) {
				insert(target, div, anchor);
				if_block.m(div, null);
			},
			p: function p(changed, ctx) {
				if (current_block_type === (current_block_type = select_block_type(ctx)) && if_block) {
					if_block.p(changed, ctx);
				} else {
					if_block.d(1);
					if_block = current_block_type(component, ctx);
					if_block.c();
					if_block.m(div, null);
				}

				if (changed._notice && div_class_value !== (div_class_value = "\n            ui-pnotify-prompt-bar\n            " + (ctx._notice.get()._styles.promptBar ? ctx._notice.get()._styles.promptBar : '') + "\n            " + (ctx._notice.get()._styles.text ? ctx._notice.get()._styles.text : '') + "\n          " + " svelte-1y9suua")) {
					div.className = div_class_value;
				}
			},
			d: function d(detach) {
				if (detach) {
					detachNode(div);
				}

				if_block.d();
			}
		};
	}

	// (21:8) {:else}
	function create_else_block_1(component, ctx) {
		var input,
		    input_updating = false,
		    input_class_value;

		function input_input_handler() {
			input_updating = true;
			component.set({ promptValue: input.value });
			input_updating = false;
		}

		function keypress_handler(event) {
			component.handleKeyPress(event);
		}

		return {
			c: function c() {
				input = createElement("input");
				addListener(input, "input", input_input_handler);
				addListener(input, "keypress", keypress_handler);
				setAttribute(input, "type", "text");
				input.className = input_class_value = "\n                ui-pnotify-prompt-input\n                " + (ctx._notice.get()._styles.input ? ctx._notice.get()._styles.input : '') + "\n                " + ctx.promptClass + "\n              " + " svelte-1y9suua";
			},
			m: function m(target, anchor) {
				insert(target, input, anchor);
				component.refs.promptSingle = input;

				input.value = ctx.promptValue;
			},
			p: function p(changed, ctx) {
				if (!input_updating && changed.promptValue) input.value = ctx.promptValue;
				if ((changed._notice || changed.promptClass) && input_class_value !== (input_class_value = "\n                ui-pnotify-prompt-input\n                " + (ctx._notice.get()._styles.input ? ctx._notice.get()._styles.input : '') + "\n                " + ctx.promptClass + "\n              " + " svelte-1y9suua")) {
					input.className = input_class_value;
				}
			},
			d: function d(detach) {
				if (detach) {
					detachNode(input);
				}

				removeListener(input, "input", input_input_handler);
				removeListener(input, "keypress", keypress_handler);
				if (component.refs.promptSingle === input) component.refs.promptSingle = null;
			}
		};
	}

	// (10:8) {#if promptMultiLine}
	function create_if_block_3(component, ctx) {
		var textarea,
		    textarea_updating = false,
		    textarea_class_value;

		function textarea_input_handler() {
			textarea_updating = true;
			component.set({ promptValue: textarea.value });
			textarea_updating = false;
		}

		function keypress_handler(event) {
			component.handleKeyPress(event);
		}

		return {
			c: function c() {
				textarea = createElement("textarea");
				addListener(textarea, "input", textarea_input_handler);
				addListener(textarea, "keypress", keypress_handler);
				textarea.rows = "5";
				textarea.className = textarea_class_value = "\n                ui-pnotify-prompt-input\n                " + (ctx._notice.get()._styles.input ? ctx._notice.get()._styles.input : '') + "\n                " + ctx.promptClass + "\n              " + " svelte-1y9suua";
			},
			m: function m(target, anchor) {
				insert(target, textarea, anchor);
				component.refs.promptMulti = textarea;

				textarea.value = ctx.promptValue;
			},
			p: function p(changed, ctx) {
				if (!textarea_updating && changed.promptValue) textarea.value = ctx.promptValue;
				if ((changed._notice || changed.promptClass) && textarea_class_value !== (textarea_class_value = "\n                ui-pnotify-prompt-input\n                " + (ctx._notice.get()._styles.input ? ctx._notice.get()._styles.input : '') + "\n                " + ctx.promptClass + "\n              " + " svelte-1y9suua")) {
					textarea.className = textarea_class_value;
				}
			},
			d: function d(detach) {
				if (detach) {
					detachNode(textarea);
				}

				removeListener(textarea, "input", textarea_input_handler);
				removeListener(textarea, "keypress", keypress_handler);
				if (component.refs.promptMulti === textarea) component.refs.promptMulti = null;
			}
		};
	}

	// (51:57) {:else}
	function create_else_block(component, ctx) {
		var text_value = ctx.button.text,
		    text;

		return {
			c: function c() {
				text = createText(text_value);
			},
			m: function m(target, anchor) {
				insert(target, text, anchor);
			},
			p: function p(changed, ctx) {
				if (changed.buttons && text_value !== (text_value = ctx.button.text)) {
					setData(text, text_value);
				}
			},
			d: function d(detach) {
				if (detach) {
					detachNode(text);
				}
			}
		};
	}

	// (51:14) {#if button.textTrusted}
	function create_if_block_1(component, ctx) {
		var raw_value = ctx.button.text,
		    raw_before,
		    raw_after;

		return {
			c: function c() {
				raw_before = createElement('noscript');
				raw_after = createElement('noscript');
			},
			m: function m(target, anchor) {
				insert(target, raw_before, anchor);
				raw_before.insertAdjacentHTML("afterend", raw_value);
				insert(target, raw_after, anchor);
			},
			p: function p(changed, ctx) {
				if (changed.buttons && raw_value !== (raw_value = ctx.button.text)) {
					detachBetween(raw_before, raw_after);
					raw_before.insertAdjacentHTML("afterend", raw_value);
				}
			},
			d: function d(detach) {
				if (detach) {
					detachBetween(raw_before, raw_after);
					detachNode(raw_before);
					detachNode(raw_after);
				}
			}
		};
	}

	// (43:6) {#each buttons as button}
	function create_each_block(component, ctx) {
		var button, button_class_value;

		function select_block_type_1(ctx) {
			if (ctx.button.textTrusted) return create_if_block_1;
			return create_else_block;
		}

		var current_block_type = select_block_type_1(ctx);
		var if_block = current_block_type(component, ctx);

		return {
			c: function c() {
				button = createElement("button");
				if_block.c();
				button._svelte = { component: component, ctx: ctx };

				addListener(button, "click", click_handler);
				button.type = "button";
				button.className = button_class_value = "\n              ui-pnotify-action-button\n              " + (ctx.button.primary ? ctx._notice.get()._styles.btnPrimary ? ctx._notice.get()._styles.btnPrimary : '' : ctx._notice.get()._styles.btn ? ctx._notice.get()._styles.btn : '') + "\n              " + (ctx.button.addClass ? ctx.button.addClass : '') + "\n            " + " svelte-1y9suua";
			},
			m: function m(target, anchor) {
				insert(target, button, anchor);
				if_block.m(button, null);
			},
			p: function p(changed, _ctx) {
				ctx = _ctx;
				if (current_block_type === (current_block_type = select_block_type_1(ctx)) && if_block) {
					if_block.p(changed, ctx);
				} else {
					if_block.d(1);
					if_block = current_block_type(component, ctx);
					if_block.c();
					if_block.m(button, null);
				}

				button._svelte.ctx = ctx;
				if ((changed.buttons || changed._notice) && button_class_value !== (button_class_value = "\n              ui-pnotify-action-button\n              " + (ctx.button.primary ? ctx._notice.get()._styles.btnPrimary ? ctx._notice.get()._styles.btnPrimary : '' : ctx._notice.get()._styles.btn ? ctx._notice.get()._styles.btn : '') + "\n              " + (ctx.button.addClass ? ctx.button.addClass : '') + "\n            " + " svelte-1y9suua")) {
					button.className = button_class_value;
				}
			},
			d: function d(detach) {
				if (detach) {
					detachNode(button);
				}

				if_block.d();
				removeListener(button, "click", click_handler);
			}
		};
	}

	function PNotifyConfirm(options) {
		var _this = this;

		init(this, options);
		this.refs = {};
		this._state = assign(data(), options.data);
		this._intro = true;

		if (!document.getElementById("svelte-1y9suua-style")) add_css();

		this._fragment = create_main_fragment(this, this._state);

		this.root._oncreate.push(function () {
			oncreate.call(_this);
			_this.fire("update", { changed: assignTrue({}, _this._state), current: _this._state });
		});

		if (options.target) {
			this._fragment.c();
			this._mount(options.target, options.anchor);

			flush(this);
		}
	}

	assign(PNotifyConfirm.prototype, {
		destroy: destroy,
		get: get,
		fire: fire,
		on: on,
		set: set,
		_set: _set,
		_stage: _stage,
		_mount: _mount,
		_differs: _differs
	});
	assign(PNotifyConfirm.prototype, methods);

	PNotifyConfirm.prototype._recompute = noop;

	setup(PNotifyConfirm);

	function createElement(name) {
		return document.createElement(name);
	}

	function append(target, node) {
		target.appendChild(node);
	}

	function createComment() {
		return document.createComment('');
	}

	function insert(target, node, anchor) {
		target.insertBefore(node, anchor);
	}

	function detachNode(node) {
		node.parentNode.removeChild(node);
	}

	function createText(data) {
		return document.createTextNode(data);
	}

	function setStyle(node, key, value) {
		node.style.setProperty(key, value);
	}

	function destroyEach(iterations, detach) {
		for (var i = 0; i < iterations.length; i += 1) {
			if (iterations[i]) iterations[i].d(detach);
		}
	}

	function addListener(node, event, handler, options) {
		node.addEventListener(event, handler, options);
	}

	function setAttribute(node, attribute, value) {
		if (value == null) node.removeAttribute(attribute);else node.setAttribute(attribute, value);
	}

	function removeListener(node, event, handler, options) {
		node.removeEventListener(event, handler, options);
	}

	function setData(text, data) {
		text.data = '' + data;
	}

	function detachBetween(before, after) {
		while (before.nextSibling && before.nextSibling !== after) {
			before.parentNode.removeChild(before.nextSibling);
		}
	}

	function init(component, options) {
		component._handlers = blankObject();
		component._slots = blankObject();
		component._bind = options._bind;
		component._staged = {};

		component.options = options;
		component.root = options.root || component;
		component.store = options.store || component.root.store;

		if (!options.root) {
			component._beforecreate = [];
			component._oncreate = [];
			component._aftercreate = [];
		}
	}

	function assign(tar, src) {
		for (var k in src) {
			tar[k] = src[k];
		}return tar;
	}

	function assignTrue(tar, src) {
		for (var k in src) {
			tar[k] = 1;
		}return tar;
	}

	function flush(component) {
		component._lock = true;
		callAll(component._beforecreate);
		callAll(component._oncreate);
		callAll(component._aftercreate);
		component._lock = false;
	}

	function destroy(detach) {
		this.destroy = noop;
		this.fire('destroy');
		this.set = noop;

		this._fragment.d(detach !== false);
		this._fragment = null;
		this._state = {};
	}

	function get() {
		return this._state;
	}

	function fire(eventName, data) {
		var handlers = eventName in this._handlers && this._handlers[eventName].slice();
		if (!handlers) return;

		for (var i = 0; i < handlers.length; i += 1) {
			var handler = handlers[i];

			if (!handler.__calling) {
				try {
					handler.__calling = true;
					handler.call(this, data);
				} finally {
					handler.__calling = false;
				}
			}
		}
	}

	function on(eventName, handler) {
		var handlers = this._handlers[eventName] || (this._handlers[eventName] = []);
		handlers.push(handler);

		return {
			cancel: function cancel() {
				var index = handlers.indexOf(handler);
				if (~index) handlers.splice(index, 1);
			}
		};
	}

	function set(newState) {
		this._set(assign({}, newState));
		if (this.root._lock) return;
		flush(this.root);
	}

	function _set(newState) {
		var oldState = this._state,
		    changed = {},
		    dirty = false;

		newState = assign(this._staged, newState);
		this._staged = {};

		for (var key in newState) {
			if (this._differs(newState[key], oldState[key])) changed[key] = dirty = true;
		}
		if (!dirty) return;

		this._state = assign(assign({}, oldState), newState);
		this._recompute(changed, this._state);
		if (this._bind) this._bind(changed, this._state);

		if (this._fragment) {
			this.fire("state", { changed: changed, current: this._state, previous: oldState });
			this._fragment.p(changed, this._state);
			this.fire("update", { changed: changed, current: this._state, previous: oldState });
		}
	}

	function _stage(newState) {
		assign(this._staged, newState);
	}

	function _mount(target, anchor) {
		this._fragment[this._fragment.i ? 'i' : 'm'](target, anchor || null);
	}

	function _differs(a, b) {
		return a != a ? b == b : a !== b || a && (typeof a === "undefined" ? "undefined" : _typeof(a)) === 'object' || typeof a === 'function';
	}

	function noop() {}

	function blankObject() {
		return Object.create(null);
	}

	function callAll(fns) {
		while (fns && fns.length) {
			fns.shift()();
		}
	}
	return PNotifyConfirm;
}(PNotify);
//# sourceMappingURL=PNotifyConfirm.js.map