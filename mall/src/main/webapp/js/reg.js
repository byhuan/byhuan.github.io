var upcode =function(id,ls){
    if(document.getElementById(id)){
        document.getElementById(id).src += "?new=" + Math.random();
        $("#"+id).prev().attr("class","");
        $("#"+id).prev().prev().val('');
    }
}
var comMsg=function(msg){
    return GetLen(msg)>=38? "<font class='f_1'>"+msg+"</font>":"<font class='f_0'>"+msg+"</font>";
}

//show error massage
var showError =function(inputid,errid,msg){
    $("#"+inputid).parent().attr("class","").addClass("regM errorBorder");
    $("#"+inputid).next().attr("class","");
    $("#"+errid).attr("class","reg_error").html(comMsg(msg));
}
//show success massage
var showSuccess = function(inputid,errid,msg){
    $("#"+inputid).parent().attr("class","").addClass("regM defaultBorder");
    $("#"+inputid).next().attr("class","regOk");
    $("#"+errid).attr("class","").html("");
}
var showRestore =function(inputid,errid){
    $("#"+inputid).parent().attr("class","").addClass("regM defaultBorder");
    $("#"+inputid).next().attr("class","");
    $("#"+errid).attr("class","").html('');
}
/*----------------------注册JS------------------------------*/

var showtip =function(inputid,spanid,key){
    var ms = defaultArr[key];
    $("#"+inputid).parent().attr("class","").addClass("regM okBorder");
    $("#"+inputid).next().attr("class","");
    $("#"+spanid).attr("class","reg_error1").html(comMsg(ms));
    return ;
}
var showPwdtip =function(inputid,spanid,key){
    var ms = defaultArr[key];
    $("#"+inputid).parent().attr("class","").addClass("regM okBorder");
    $("#"+inputid).next().attr("class","");
    $("#"+spanid).attr("class","reg_error2").html(comMsg(ms));
    return ;
}
var showCodetip =function(inputid,spanid,key){
    var ms = defaultArr[key];
    $("#"+inputid).attr("class","").addClass("regCodeInput okBorder");
    $("#"+spanid).attr("class","reg_error1").html(comMsg(ms));
    return ;
}
var showCodeError =function(inputid,errid,msg){
    $("#"+inputid).attr("class","").addClass("regCodeInput errorBorder");
    $("#"+errid).attr("class","reg_error").html(comMsg(msg));
}
//check password
var ckpwd=function(isCk,keyup){
    var val =$.trim( $("#"+PwdId).val() );
    if(val.length<6&&keyup==1){
        showStrong(PwdErrId,pwdStrong,0);
        showRestore(PwdId,PwdErrId);
        return false;
    }
    if(!isCk && !val){
        showRestore(PwdId,PwdErrId);
        return false;
    }
    if(val == ""){
        showError(PwdId,PwdErrId,pwdArr[0]);
        return false;
    }else if( pwdTotal(val) ==0){
        showError(PwdId,PwdErrId,pwdArr[3]);
        return false;
    }else if( pwdTotal(val) ==-1){
        showError(PwdId,PwdErrId,pwdArr[3]);
        return false;
    }else if( pwdTotal(val) <=50){
        $("#"+PwdId).parent().attr("class","").addClass("regM defaultBorder");
        $("#"+PwdId).next().attr("class","regOk");
        showStrong(PwdErrId,pwdStrong,1);
        return 1;
    }else if( pwdTotal(val)>51&&pwdTotal(val) <=60){
        showStrong(PwdErrId,pwdStrong,2);
        showSuccess(PwdId,PwdErrId,OkArr[0]);
        return 1;
    }else if( pwdTotal(val)>60){
        showStrong(PwdErrId,pwdStrong,3);
        showSuccess(PwdId,PwdErrId,OkArr[0]);
        return 1;
    }
    return false;
}
// check password 2
var ckpwd2=function(isCk){
    var val =$.trim( $("#"+PwdId).val() );
    var val2 =$.trim( $("#"+PwdId2).val() );
    if(!isCk && !val2){
        showRestore(PwdId2,PwdErrId2);
        return false;
    }
    if(val2 == ''){
        showError(PwdId2,PwdErrId2,pwd2Arr[0]);
        return false;
    }else if(val2!= val){
        showError(PwdId2,PwdErrId2,pwd2Arr[1]);
        return false;
    }
    showSuccess(PwdId2,PwdErrId2,OkArr[0]);
    return 1;
}


var ckAgree =function(){
    var Agreestat = document.getElementById(AgreementId).checked;
    if(Agreestat==false){
        $("#"+AgreementErrId).attr("class","").addClass("reg_error").html( comMsg(agreeArr[0]) );
        return false;
    }
    $("#"+AgreementErrId).attr("class","").html('');
    return 1;
}
$("#"+pageCodeId).live("keyup",function(event){
    if (event.keyCode == 13) {
        sub_data();
    }
});
$("#"+MobileCodeId).live("keyup",function(event){
    if (event.keyCode == 13) {
        sub_data();
    }
});

var sub_data =function(){
    var mem = $.trim( $("#"+MailMId).val() );
    var cknameval = $.trim( $("#nameRegOk").val() );
    var a1= cknameval==1?true:false;
    var a2 = ckpwd(1);
    var a3 = ckpwd2(1);
    var a4 = false;
    var tjuid=$("#tjuid").val();
    var a5 = ckAgree(1);
    if(mobile_preg(mem)){
        var a41= ckmcode(1);
        var a42=ckcode(1);
        if(a41==true&&a42==true){
            var a4 = true;
        }else{
            var a4 = false;
        }
    }else{
        var a4 =ckcode(1);
    }
    var a6 = true;
    if($("#"+sfCodeId).val()){
        ckdmcode(1);
        var a6 = !$("#"+sfCodeErrId).html()?true:false;
    }
    if(!a1|| a2==false ||a3==false||a4==false||a5==false||a6==false){
        return false;
    }
    $("#sub_per").html('<a class="unit_login_in" href="javascript:void(0);">注册中...</a>');
    $.post("/register/Regperson/",$('#regForm_mod').serialize().replace(/\+/g,"")+"&tjuid="+tjuid,function(data){
        if(data=="y"){
            //跳转到注册成功页面
            $("#"+pageCodeId).attr("disabled", true);
            $("#"+MobileCodeId).attr("disabled", true);
            location.href="/reg/success/";
            return false;
        }
        if(data=="yy"){// 推荐
            $("#"+pageCodeId).attr("disabled", true);
            $("#"+MobileCodeId).attr("disabled", true);
            location.href="/recommend/?uid="+tjuid;
            return false;
        }
        $("#sub_per").html('<a href="javascript:void(0);" class="registerNow" id="reg_per_data">立即注册</a>');
        $("#"+pageCodeId).attr("disabled", false);
        $("#"+MobileCodeId).attr("disabled", false);
        upcode(codeimgid);
        jAlert('注册失败：' + data);
    });
}

//$("#reg_per_data").live("click",function(){sub_data();});