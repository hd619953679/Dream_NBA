var ua=null;//保存合法的用户名
var up=null;//保存合法的密码
var cup=null;//保存确认密码状态;
var regName=/^\w{3,10}[@]\w{1,6}[.]com([.]cn)?$/;
var regPwd=/^.{6,18}$/;
$("#uname").focus(function(){
    $("#unameTip").html("用户名必须是邮箱格式").removeClass('false')
        .addClass("tip");
});
$("#upwd").focus(function(){
    $("#upwdTip").html("密码为6~18位任意字符").removeClass('false')
        .addClass("tip");
});
$("#confirm-upwd").focus(function(){
    $("#confirmUpwdTip").html("请再输一次密码").removeClass('false')
        .addClass("tip");
});
//正则+服务器验证用户名
$("#uname").blur(function(){
    var uname=$(this).val();
    if(regName.test(uname)){
        $.ajax({
            type:'GET',
            url:'php/check_uname.php?uname='+uname,
            success:function(data){
                if(data.code===1){
                    $("#unameTip").html(data.msg);//该用户名可以使用
                    ua=uname;
                }else if(data.code===-2){
                    $("#unameTip").html(data.msg).removeClass("tip")
                        .addClass('false');//该用户名已被占用!
                    ua=null;
                }else{
                    $("#unameTip").html(data.msg).removeClass('tip')
                        .addClass("false");//用户名不能为空!
                    ua=null;
                }
            }
        });
    }else if(uname===''){
        $("#unameTip").html("用户名不能为空!").removeClass('tip')
            .addClass("false");
        ua=null;
    }else{
        $("#unameTip").html("用户名格式不正确!").removeClass('tip')
            .addClass("false");
        ua=null;
    }
});
//验证密码
$("#upwd").blur(function(){
    var upwd=$(this).val();
    if(regPwd.test(upwd)){
        $("#upwdTip").html("密码格式正确");
        up=upwd;
    }else if(upwd===""){
        $("#upwdTip").html("密码不能为空！").removeClass('tip')
            .addClass('false');
        up=null;
    }else{
        $("#upwdTip").html("密码格式不正确！").removeClass('tip')
            .addClass('false');
        up=null;
    }
});
$("#confirm-upwd").blur(function(){
    var conP=$(this).val();
    if(conP===up){
        $("#confirmUpwdTip").html('').removeClass('false')
            .addClass('tip');
        cup=true;
    }else if(conP===''){
        $("#confirmUpwdTip").html('请再次输入密码!')
            .removeClass('tip').addClass('false');
        cup=false;
    }else{
        $("#confirmUpwdTip").html('您两次输入的密码不一致!')
            .removeClass('tip').addClass('false');
        cup=false;
    }
});

//提交合法用户名,密码至注册页
$("#register-btn").click(function(){
    if(ua&&up&&cup){
        console.log("合法账号:"+ua);
        console.log("合法密码:"+up);
        $.ajax({
            type:'POST',
            url:'php/register.php',
            data:{uname:ua,upwd:up},
            success:function(data){
                if(data.code===1){
                    regSuccess.innerHTML=
                        "<a href='index.html'>" +
                        "注册成功!返回首页</a>";
                    $('#regSuccess').html("<a href='index.html'>" +
                    "注册成功!返回首页</a>")
                        .removeClass('false').addClass('regSuccess');
                }else{
                    $('#regSuccess').html(data.msg).removeClass('regSuccess')
                        .addClass('false');
                }
            }
        });
    }else if(!ua){
        uname.focus();
    }else if(!up){
        upwd.focus();
    }else{
        $("#confirm-upwd")[0].focus();
    }
});