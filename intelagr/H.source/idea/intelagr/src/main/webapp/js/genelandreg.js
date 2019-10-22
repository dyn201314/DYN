alert("gene");

function addRow(tableId){
	var testTbl = $("#" + tableId);
	//添加一行
	var newTr = testTbl.insertRow();
	//添加两列
	var newTd0 = newTr.insertCell();
	var newTd1 = newTr.insertCell();
	//设置列内容和属性
	newTd0.innerHTML = '<input type=checkbox id="box4">';

	newTd2.innerText= '新加行';
}