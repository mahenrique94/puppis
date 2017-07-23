NodeList.prototype.forEach = Array.prototype.forEach; 
HTMLCollection.prototype.forEach = Array.prototype.forEach;

/** @auth Matheus Castiglioni
 *  Component para realizar buscas e filtros em selects
 */
class SSearch {
	
	constructor(select) {
		this.list = null;
		this.data = null;
		this.icon = null;
		this.select = select;
	}
	
	init() {
		this.select.parentNode.appendChild(this.create());
	}
	
	// Criando a div que irá agrupar todos os components do ss
	create() {
		const ssComponents = document.createElement("div");
		this.list = this.createList();
		ssComponents.classList.add("ss-search__components");
		ssComponents.appendChild(this.createFilter());
		ssComponents.appendChild(this.createIcon());
		ssComponents.appendChild(this.list);
		return ssComponents;
	}
	
	// Criando o input responsável por filtrar ou buscar as informações
	createFilter() {
		const list = this.list;
		const ssData = document.createElement("input");
		ssData.classList.add("o-form__data", "ss-search__data", "ss-search__filter");
		ssData.setAttribute("type", "text");
		ssData.setAttribute("aria-controls", `ssSearch__${this.select.id}`);
		let ssDataAux = document.querySelector(`input[type=hidden][name="${this.select.name}aux"]`);
		if (ssDataAux) {
			let ssDataValue = ssDataAux.value;
			setTimeout(function() {
				let ssDataItem = list.querySelector(`[data-ss-value="${ssDataValue}"]`);
				ssData.value = ssDataItem ? ssDataItem.textContent : "";
			}, 1500);
		}
		ssData.addEventListener("focus", function() {
			autoSize(this.parentNode.previousSibling.previousSibling);
			toggleIcon(this.nextSibling);
			filter(ssData, list);
			showElement(list);
		});
		ssData.addEventListener("keyup", function(event) {
			if (event.keyCode === 38 || event.keyCode === 40) {
				// seta para cima
				if (event.keyCode === 38)
					previusItem(list);
				// seta para baixo
				if (event.keyCode === 40)
					nextItem(list);
			} else {
				filter(this, list);
			}
		});
		ssData.addEventListener("keypress", function(event) {
			// enter
			if (event.keyCode === 13) {
				event.preventDefault();
				chooseItem(list);
				this.blur();
			}
		});
		this.data = ssData;
		return ssData;
	}
	
	createIcon() {
		const icon = document.createElement("span");
		icon.classList.add("icon-angle-down", "ss-search__icon");
		icon.addEventListener("click", function() {
			toggleIcon(this);
			autoSize(this.previousSibling.parentNode.previousSibling.previousSibling);
		});
		this.icon = icon;
		return icon;
	}
	
	// Criando a lista de opções para serem filtradas
	createList() {
		const createItem = this.createItem;
		const select = this.select;
		const list = document.createElement("ul");
		list.classList.add("ss-search__list", "is-hide");
		list.setAttribute("aria-hidden", "true");
		list.setAttribute("aria-expanded", "false");
		setTimeout(function() {
			select.options.forEach(option => {
				list.appendChild(createItem(option.textContent, option.value));
			});
		}, 1000);
		return list;
	}
	
	// Criando cada item da lista
	createItem(text, value) {
		const item = document.createElement("li");
		item.classList.add("ss-search__item");
		item.textContent = text;
		item.setAttribute("data-ss-value", value);
		item.addEventListener("click", function() {
			selectedItem(this);
		});
		return item;
	}
	
	update() {
		this.list.remove();
		this.list = this.createList()
		this.data.parentNode.appendChild(this.list);
	}
	
}

function autoSize(obj) {
	if (obj.classList.contains("js-autoSize"))
		obj.parentNode.style.height = "300px";
}

function toggleIcon(icon) {
	if (icon.classList.contains("icon-angle-down")) {
		showElement(icon.nextSibling);
		icon.classList.remove("icon-angle-down");
		icon.classList.add("icon-angle-up");
	} else {
		hideElement(icon.nextSibling);
		icon.classList.remove("icon-angle-up");
		icon.classList.add("icon-angle-down");
	}
}

// Selecionando o item e definindo ele como valor do select
function selectedItem(item) {
	let evt = new Event("change");
	let value = item.getAttribute("data-ss-value");
	let filter = item.parentNode.parentNode.querySelector("input.ss-search__filter");
	let select = item.parentNode.parentNode.parentNode.querySelector("select.ss-search");
	filter.value = item.textContent;
	select.value = value;
	select.dispatchEvent(evt);
	hideElement(item.parentNode);
	toggleIcon(filter.nextSibling);
}

// Filtrar os itens de acordo com o valor digitado no input
function filter(filter, list) {
	let regExp = new RegExp(filter.value, "gi");
	let regExpMark = new RegExp("(([<])(.*)([>]))", "gim");
	if (filter.value != "") {
		removeHovered(list);
		list.children.forEach(item => {
			item.texContent = item.textContent.replace(regExpMark, "");
			let matches = item.textContent.match(regExp);
			if (matches != null && matches.length > 0) {
				showElement(item);
				item.style.display = "block";
				matches.forEach(match => item.innerHTML = item.textContent.replace(match, `<mark class="ss-search__match">${match}</mark>`));
			} else {
				item.style.display = "none"; 
				hideElement(item);
			}
		});
	} else {
		list.children.forEach(item => {
			item.innerHTML = item.textContent.replace(regExpMark, "");
			showElement(item);
			item.style.display = "block";
		});
	}
}

function toggleElement(element) {
	if (element.classList.contains("is-hide")) {
		showElement(element);
	} else {
		hideElement(element);
		element.blur();
	}
}

function showElement(element) {
	element.classList.remove("is-hide");
	element.classList.add("is-show");
	element.setAttribute("aria-hidden", "false");
	element.setAttribute("aria-expanded", "true");
}

function hideElement(element) {
	element.classList.remove("is-show");
	element.classList.add("is-hide");
	element.setAttribute("aria-hidden", "true");
	element.setAttribute("aria-expanded", "false");
}

// Ir para o item anterior da lista com as setas do teclado
function previusItem(list) {
	if (hasItemHovered(list)) {
		let hover = findHovered(list);
		let previous = getPrevious(hover);
		hover.classList.remove("is-hovered");
		previous.classList.add("is-hovered");
	}
}

// Ir para o próximo item da lista com as setas do teclado
function nextItem(list) {
	if (hasItemHovered(list)) {
		let hover = findHovered(list);
		let next = getNext(hover);
		hover.classList.remove("is-hovered");
		next.classList.add("is-hovered");
	} else {
		const item = list.querySelector(".ss-search__item.is-show");
		if (item.textContent != "") 
			item.classList.add("is-hovered");
		else
			item.nextSibling.classList.add("is-hovered");
	}
}

function getPrevious(hover) {
	hover = hover.previousSibling;
	if (hover.classList.contains("is-hide"))
		return getPrevious(hover);
	return hover;
}

function getNext(hover) {
	hover = hover.nextSibling;
	if (hover.classList.contains("is-hide"))
		return getNext(hover);
	return hover;
}

// Selecionar item na lista com o enter
function chooseItem(list) {
	const hover = findHovered(list);
	if (hover)
		selectedItem(hover);
}

function findHovered(list) {
	return list.querySelector(".is-hovered");
}

function hasItemHovered(list) {
	return findHovered(list) != undefined;
}

function removeHovered(list) {
	let hover = findHovered(list);
	if (hover)
		hover.classList.remove("is-hovered");
}

const selects = document.querySelectorAll("select.ss-search");
if (selects.length > 0) {
	selects.forEach(select => {
		let ssearch = new SSearch(select);
		ssearch.init();
		select.addEventListener("change", function() {
			ssearch.update();
		});
	});
}