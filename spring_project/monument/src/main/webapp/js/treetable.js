(function() {
	'use strict';

	// JSON 파일 불러오기
	var input = (function() {
		var json = null;
		$.ajax({
			'async' : false,
			'global' : false,
			'url' : "data.json",
			'dataType' : "json",
			'success' : function(data) {
				json = data;
			}
		});
		return json;
	})();

	function createTreeTable(columns, models) {

		var tt = document.createElement('table');
		tt.classList.add('tree-table');

		var thead = document.createElement('thead');
		var theadRow = document.createElement('tr');
		thead.appendChild(theadRow);

		columns.forEach(function(columnName) {
			var headCol = document.createElement('td');
			headCol.innerHTML = columnName;
			theadRow.appendChild(headCol);
		});

		tt.appendChild(thead);

		var nodes = createNodes(models);
		nodes.forEach(function(node) {
			tt.appendChild(node);

		});
		return tt;
	}
	;

	function createNodes(models, layer) {
		layer = layer || 0;
		var nodes = [];
		models.forEach(function(model, index) {
			var node = document.createElement('tr');
			node.classList.add('layer-' + layer);
			var hasChildren = model.hasOwnProperty('children');
			var childNodes = null;
			var cell;
			if (hasChildren)
				childNodes = createNodes(model.children, layer + 1);

			Object.keys(model).forEach(
					function(key, keyIndex) {
						// 키가 status일때 
						if (key !== 'children') {
							cell = document.createElement('td');
							cell.classList.add('tt-cell');

							if (keyIndex === 0 && hasChildren) {
								cell.classList.add('tt-node');
								var expandBtn = document.createElement('span');
								expandBtn.classList.add('expand-btn');
								expandBtn.innerHTML = '-';

								function createExpandHandler(childNodes, btn) {
									return function() {
										if (btn.innerHTML == '-') {
											childNodes.forEach(function(
													childNode) {
												childNode.classList
														.add('hidden');
											});
											expandBtn.innerHTML = '+';
										} else if (btn.innerHTML == '+') {
											childNodes.forEach(function(
													childNode) {
												childNode.classList
														.remove('hidden');
											});
											expandBtn.innerHTML = '-';
										}
									};
								}
								expandBtn.addEventListener('click',
										createExpandHandler(childNodes,
												expandBtn));
								cell.appendChild(expandBtn);

								// key가 status인 곳에 resource아이콘
								var icon = document.createElement('img');
								icon.setAttribute('src',
										'images/icon_resource.png');
								cell.appendChild(icon);
							}
							// 아이콘
							if (key == "name") {
								var icon = document.createElement('img');
								if (model.type == "string"
										|| model.type == "boolean") {
									icon.setAttribute('src',
											'images/icon_primitive.png');
								} else {
									icon.setAttribute('src',
											'images/icon_datatype.gif');
								}
								cell.appendChild(icon);
							}
							//var temp = "${pageContext.request.contextPath}";
							// 링크
							if (key == "name") {
								var link = document.createElement("a");
								link.appendChild(document
										.createTextNode(model[key]));
								link.setAttribute('href', contextPath+'/hpage');
								cell.appendChild(link);
							} else {
								cell.appendChild(document
										.createTextNode(model[key]));
							}
							node.appendChild(cell);
						}
					});

			nodes.push(node);

			if (hasChildren) {
				var childContainer = document.createElement('tbody');
				var subChilds = null;

				childNodes.forEach(function(childNode) {
					if (childNode.tagName !== 'TBODY')
						childContainer.appendChild(childNode);
					else
						subChilds = childNode;
				});

				nodes.push(childContainer);
				if (subChilds)
					nodes.push(subChilds);
			}
		});
		return nodes;
	}
	;

	window.onload = function() {
		$(function() {
			$('ul.tab li').click(function() {
				var activeTab = $(this).attr('data-tab');
				$('ul.tab li').removeClass('current');
				$('.tabcontent').removeClass('current');
				$(this).addClass('current');
				$('#' + activeTab).addClass('current');
			})
		});
		var divTab1 = document.getElementById("tab1");
		var tt = createTreeTable(input.columns, input.models);
		divTab1.appendChild(tt);

		var obj = JSON.stringify(input, null, 2);
		var divTab2 = document.getElementById("jsonTab");
		divTab2.innerHTML = obj;
	};
})();
