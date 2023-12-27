function movePage(){
    const Language = document.getElementsByName('languageChecked');
    Language.forEach((node)=>{
        if(node.checked){
            var form = document.moveform;
            form.method = "get";
            form.action = node.value+"StudyList.jsp";
            form.submit();
        }
    })
}

