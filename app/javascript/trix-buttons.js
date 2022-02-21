// trix buttons //
// var Trix = require("trix"); // Trix is already required when using importmap however in esbuild it needs not to be commented out

// yellow bg highlight and text underline
Trix.config.textAttributes.highlight = {
  style: { 
    backgroundColor: "yellow" 
  },
  parser: function(element) {
  	return element.style.backgroundColor === "yellow"
  },
  inheritable: true
}
addEventListener("trix-initialize", function(event) {
  var buttonHTML = '<button type="button" class="highlight trix-button px-2" data-trix-attribute="highlight" title="Highlight">H</button>'
  event.target.toolbarElement.
  querySelector(".trix-button-group").
  insertAdjacentHTML("beforeend", buttonHTML)
})
Trix.config.textAttributes.underline = {
  style: {
    textDecoration: "underline"
  },
  inheritable: true,
  parser: (element) => {
    const style = window.getComputedStyle(element);
    return style.textDecoration === "underline" ||
      style.textDecorationLine === "underline";
  },
}
addEventListener("trix-initialize", function(event) {
  var buttonHTML = '<button type="button" class="underline trix-button px-2" data-trix-attribute="underline" title="underline">U</button>'
  event.target.toolbarElement.
  querySelector(".trix-button-group").
  insertAdjacentHTML("beforeend", buttonHTML)
})
// red, blue, and green text-color buttons
Trix.config.textAttributes.red = { 
	style: { color: "red" },
  parser: function(element) {
  	return element.style.color === "red"
  },
  inheritable: true
 }
Trix.config.textAttributes.blue = { 
	style: { color: "blue" },
  parser: function(element) {
  	return element.style.color === "blue"
  },
  inheritable: true
 }
 Trix.config.textAttributes.green = { 
	style: { color: "green" },
  parser: function(element) {
  	return element.style.color === "green"
  },
  inheritable: true
 }
addEventListener("trix-initialize", function(event) {  
  var buttonHTML = `
    <details class="dropdown">
    	<summary class="button trix-button px-2">
        🎨
      </summary>
      <div class="menu">
        <div class="colors">
          <button type="button" data-trix-attribute="red" class="colors__item colors__item--red">R</button>
          <button type="button" data-trix-attribute="blue" class="colors__item colors__item--blue">B</button>
          <button type="button" data-trix-attribute="green" class="colors__item colors__item--green">G</button>
         </div>
      </div>
    </details>
  `
	event.target.toolbarElement.
  	querySelector(".trix-button-group").
		insertAdjacentHTML("beforeend", buttonHTML);
  const details = document.querySelectorAll(".dropdown");
  details.forEach((targetDetail) => {
    targetDetail.addEventListener("click", () => {
      details.forEach((detail) => {
        detail.removeAttribute("open");
      });
    });
  });
})
// sup and sub buttons
Trix.config.textAttributes.sup = { tagName: "sup", inheritable: true }
Trix.config.textAttributes.sub = { tagName: "sub", inheritable: true }
addEventListener("trix-initialize", function(event) {
	var element = event.target
  var editor = element.editor
  var toolbarElement = element.toolbarElement
  var groupElement = toolbarElement.querySelector(".trix-button-group--block-tools")
	groupElement.insertAdjacentHTML("beforeend", '<button type="button" class="trix-button" data-trix-attribute="sup"><sup>SUP</sup></button>')
  groupElement.insertAdjacentHTML("beforeend",'<button type="button" class="trix-button" data-trix-attribute="sub"><sub>SUB</sub></button>')
  var selectedAttributes = new Set
  function updateSelectedAttributes() {
    selectedAttributes = new Set
    var selectedRange = editor.getSelectedRange()
    if (selectedRange[0] === selectedRange[1]) { selectedRange[1]++ }
    var selectedPieces = editor.getDocument().getDocumentAtRange(selectedRange).getPieces()
    selectedPieces.forEach(function(piece) {
    	Object.keys(piece.getAttributes()).forEach(function(attribute) {
      	selectedAttributes.add(attribute)
      })
    })
  }
  function enforceExclusiveAttributes() {
    if (editor.attributeIsActive("sup") && selectedAttributes.has("sub")) {
    	editor.deactivateAttribute("sub")
      updateSelectedAttributes()
    } else if (editor.attributeIsActive("sub") && selectedAttributes.has("sup")) {
    	editor.deactivateAttribute("sup")
      updateSelectedAttributes()
    }
  }  
	updateSelectedAttributes()
  element.addEventListener("trix-selection-change", updateSelectedAttributes) 
  element.addEventListener("trix-change", enforceExclusiveAttributes)
})