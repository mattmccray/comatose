// =======
// = CSS =
// =======
CodeHighlighter.addStyle("css", {
  comment : {
    exp  : /\/\*[^*]*\*+([^\/][^*]*\*+)*\//
  },
  keywords : {
    exp  : /@\w[\w\s]*/
  },
  selectors : {
    exp  : "([\\w-:\\[.#][^{};>]*)(?={)"
  },
  properties : {
    exp  : "([\\w-]+)(?=\\s*:)"
  },
  units : {
    exp  : /([0-9])(em|en|px|%|pt)\b/,
    replacement : "$1<span class=\"$0\">$2</span>"
  },
  urls : {
    exp  : /url\([^\)]*\)/
  }
});

// ========
// = HTML =
// ========
CodeHighlighter.addStyle("html", {
  comment : {
    exp: /(&lt;|\<)!\s*(--([^-]|[\r\n]|-[^-])*--\s*)(&gt;|\>)/
  },
  tag : {
    exp: /(&lt;\/?)([a-zA-Z]+\s?)/, 
    replacement: "<span class=\"$0\">$1$2</span>"
  },
  endtag : {
    exp: /(&gt;|\>|\/\>)/
  },
  string : {
    exp  : /'[^']*'|"[^"]*"/
  },
  attribute : {
    exp: /\b([a-zA-Z-:]+)(=)/, 
    replacement: "<span class=\"$0\">$1</span><span class=\"eqls\">$2</span>"
  },
  doctype : {
    exp: /(&lt;|\<)!DOCTYPE([^&]|&[^g]|&g[^t])*(&gt;|\>)/
  },
});

// ==============
// = JavaScript =
// ==============
CodeHighlighter.addStyle("javascript",{
  comment : {
    exp  : /(\/\/[^\n]*(\n|$))|(\/\*[^*]*\*+([^\/][^*]*\*+)*\/)/
  },
  brackets : {
    exp  : /\(|\[|\{|\}|\]|\)/
  },
  modifiers : {
    exp : /(\+|\-|\*|\/|\=|\.|\:|\;)/
  },
  string : {
    exp  : /'[^']*'|"[^"]*"/
  },
  keywords : {
    exp  : /\b(arguments|break|case|continue|default|delete|do|else|false|for|function|if|in|instanceof|new|null|return|switch|this|true|typeof|var|void|while|with)\b/
  },
  global : {
    exp  : /\b(toString|valueOf|window|element|prototype|constructor|document|escape|unescape|parseInt|parseFloat|setTimeout|clearTimeout|setInterval|clearInterval|NaN|isNaN|Infinity)\b/
  }
});

// ========
// = Ruby =
// ========
CodeHighlighter.addStyle("ruby",{
  comment : {
    exp  : /#[^\n]+/
  },
  brackets : {
    exp  : /\(|\)/
  },
  modifiers : {
    exp  : /(\+|\-|\*|\/|\=|\.|\:\:)/
  },
  string : {
    exp  : /'[^']*'|"[^"]*"/
  },
  keywords : {
    exp  : /\b(do|end|self|class|def|if|module|yield|then|else|for|until|unless|while|elsif|case|when|break|retry|redo|rescue|require|raise)\b/
  },
  symbol : {
    exp : /(:[A-Za-z0-9_!?]+)/
  },
  attribute : {
    exp : /(@[A-Za-z0-9_!?]+)/
  }
});