//字数超出限制
function helpFunctionOne(diffNode){
	diffNode.innerHTML="字数超出限制，请重新输入";
	diffNode.style.color="red";
}

//字数没有超出限制
function helpFunctionTwo(diffNode){
	diffNode.innerHTML="字数合法";
	diffNode.style.color="green";
	diffNode.style.fontWeight="bold";
}

//什么也没有输入的情况
function helpFunctionThree(diffNode){
	diffNode.style.color="red";
}

function sameFunction(inputNode,remindNode,number,Chinese){
    var nameLength=parseInt(inputNode.length);
    if(nameLength>number){
		helpFunctionOne(remindNode);
		return false;
	}
	else if(nameLength==0){
		remindNode.innerHTML=Chinese+"不能为空";
		helpFunctionThree(remindNode);
		return false;
	}
	else{
		helpFunctionTwo(remindNode);
		return true;
	}
}