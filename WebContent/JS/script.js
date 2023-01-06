function makeActive(linkid)
{
	document.getElementById(linkid).style.color="red";
}
function compareDate()
{
	if(document.getElementById("date1").value>=document.getElementById("date2").value){
		alert("First date should be smaller than second date");
		return false;
	}
	return true;
}