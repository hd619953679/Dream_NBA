$(function () {

    var playerData=[];
    checkPlayer(1);
    //请求球队数据
    $.ajax({
        type:'GET',
        url:'php/select-team.php',
        success:function (data) {
            var fragE=document.createDocumentFragment();
            var fragW=document.createDocumentFragment();
            $(data).each(function (i) {
                if(this.location==='east'){
                    var li=$(`<li class="list-group-item"><a href="${this.team_id}">${this.ch_tname}</a></li>`);
                    $(fragE).append(li[0]);
                }else{
                    var li=$(`<li class="list-group-item"><a href="${this.team_id}">${this.ch_tname}</a></li>`);
                    $(fragW).append(li[0]);
                }
            });
            $("#east").append($(fragE));
            $("#west").append($(fragW));
            $("#east>li>a:eq(0)").addClass('active');
        }
    });

    $("ul.list-group").on('click','.list-group-item>a',function (e) {
        e.preventDefault();
        var href=$(this).attr('href');
        $('ul.list-group a.active').removeClass('active');
        $(this).css('textDecoration','none').addClass('active');
        var result=isCache(href);
        if(result[0]){//如果有缓存就获取playerData数组中的缓存数据显示
            //console.log(result[1]);
            var html='';
            $(result[1]).each(function () {
                html+=`
                       <tr>
                            <td><img src="images/team-player/${this.photo}" alt=""></td>
                            <td>${this.Chpname}</td>
                            <td>${this.Enpname}</td>
                            <td>${this.num}</td>
                            <td>${this.position}</td>
                            <td>${this.tall}</td>
                            <td>${this.weight}</td>
                            <td>${this.age}</td>
                        </tr>
                   `;
            });
            $("#player-info>tbody").html(html);
        }else{//否则就请求数据
            checkPlayer(href);
        }
    });

    //检查该球队球员信息是否有缓存
    function isCache(teamId) {
        //1.找当前teamId在playerData数组中有没有对应的球员信息;
        //2.如果没有就请求数据并缓存，否则直接获取playerData数组中的数据显示
        for(var i=0;i<playerData.length;i++){
            if(playerData[i][0].team_id===teamId){
                break;
            }
        }
        if(i==playerData.length)
            return [false];//不存在
        else
            return [true,playerData[i]];//存在就返回该球队所有球员
    }


    function checkPlayer(teamId) {
        $.ajax({
            type:'GET',
            url:'php/select-player.php?teamId='+teamId,
            success:function (data) {
                var html='';
                $(data).each(function () {
                    html+=`
                       <tr>
                            <td><img src="images/team-player/${this.photo}" alt=""></td>
                            <td>${this.Chpname}</td>
                            <td>${this.Enpname}</td>
                            <td>${this.num}</td>
                            <td>${this.position}</td>
                            <td>${this.tall}</td>
                            <td>${this.weight}</td>
                            <td>${this.age}</td>
                        </tr>
                   `;
                });
                $("#player-info>tbody").html(html);
                playerData.push(data);//缓存数据
                // console.log(playerData);
            }
        });
    }
});