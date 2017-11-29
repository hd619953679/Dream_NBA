$(function () {


    //tab
    $("a.data-tab").click(function (e) {
        e.preventDefault();
        $(this).addClass('active').siblings('.active')
            .removeClass('active');
        var href=$(this).attr('href');
        $("#"+href).addClass('active').siblings('.active')
            .removeClass('active');
    });


    var  ppc=10;//每页显示数据个数
    var  ppn=6  ;//每页显示的页码个数
    const offset=5;//li的marginLeft
    const liWidth=25;//页码li宽

    //请求球员页码
    $.ajax({
        type:'GET',
        url:'php/pd-dataPageCount.php',
        success:function (data) {
            var ppageObj=$('#player-data-main .checkPage');
            var pageCount=setPage(ppageObj,data[0],ppc);
            if(pageCount>ppn){
                ppageObj.parent().css('width',(liWidth+offset)*ppn+'px');//控制显示页码个数
                $('#player-data-main .prev,#player-data-main .next').css('display','block');
            }else{
                $('#player-data-main .prev,#player-data-main .next').css('display','none');
            }
        }
    });

    //请求球队页码
    $.ajax({
        type:'GET',
        url:'php/td-dataPageCount.php',
        success:function (data) {
            var tpageObj=$('#team-data-main .checkPage');
            var pageCount=setPage(tpageObj,data[0],ppc);
            if(pageCount>ppn){
                tpageObj.parent().css('width',(liWidth+offset)*ppn+'px');//控制显示页码个数
                $('#team-data-main .prev,#team-data-main .next').css('display','block');
            }else{
                $('#team-data-main .prev,#team-data-main .next').css('display','none');
            }
        }   
    });


    //加载数据(按得分排名)
    getPlayerData(0,'score');
    getTeamData(0,'score');


    //球员表头排序加载
    $("#player-data-main .table th.sort").click(function () {
        var pageNo=$("#player-data-main .checkPage>li.selected")
            .text();
        var starti=(parseInt(pageNo)-1)*ppc;
        thLoadData($(this),getPlayerData,starti);
    });

    //球队表头排序加载
    $("#team-data-main .table th.sort").click(function () {
       var pageNo=$("#team-data-main .checkPage>li.selected")
           .text();
       var starti=(parseInt(pageNo)-1)*ppc;
       thLoadData($(this),getTeamData,starti);
    });

    //球员页码加载数据
    $('#player-data-main .checkPage').on('click','li',function () {
        var orderBy=$('#player-data-main .table th.selected')
            .attr("name");
        pageLoadData($(this),getPlayerData,orderBy);
    });

    //球队页码加载数据
    $('#team-data-main .checkPage').on('click','li',function () {
            var orderBy=$('#team-data-main .table th.selected')
                .attr("name");
            pageLoadData($(this),getTeamData,orderBy);
    });
   //球员页码翻页
    var pmoved=0;//球员页码位移的li个数
    var tmoved=0;
    $('#player-data-main .next').click(function () {
        var lis=$('#player-data-main .checkPage>li');
        if(lis.length-Math.abs(pmoved)>ppn){
            pmoved--;
            $('#player-data-main .checkPage').css('left',pmoved*(liWidth+offset)+'px');
        }
    });
    $('#player-data-main .prev').click(function () {
        if(Math.abs(pmoved)>0){
            pmoved++;
            $('#player-data-main .checkPage').css('left',pmoved*(liWidth+offset)+'px');
        }
    });
    //球队页码翻页
    $('#team-data-main .next').click(function () {
        var lis=$('#team-data-main .checkPage>li');
        if(lis.length-Math.abs(tmoved)>ppn){
            tmoved--;
            $('#team-data-main .checkPage').css('left',tmoved*(liWidth+offset)+'px');
        }
    });
    $('#team-data-main .prev').click(function () {
        if(Math.abs(tmoved)>0){
            tmoved++;
            $('#team-data-main .checkPage').css('left',tmoved*(liWidth+offset)+'px');
        }
    });


    //请求球员数据
    function getPlayerData(starti,orderBy) {
        $.ajax({
            type:'GET',
            data:{starti:starti,ppc:ppc,orderBy:orderBy},
            url:'php/select-player-data-detail.php',
            success:function (data) {
                // console.log(data);
                var html='';
                var firstRank=starti+1;//每页第一行排序号
                $(data).each(function () {
                    html+=`
                         <tr>
                            <td>
                                <span>${firstRank++}</span>
                            </td>
                            <td>
                                <img src="images/team-player/${this.photo}" alt="">
                                <span>${this.Chpname}</span>
                            </td>
                            <td>${this.ch_tname}</td>
                            <td>${this.s_hit_rate+'%'}</td>
                            <td>${this.t_hit_rate}%</td>
                            <td>${this.score}</td>
                            <td>${this.rebound}</td>
                            <td>${this.assist}</td>
                            <td>${this.ST}</td>
                            <td>${this.block_shot}</td>
                            <td>${this.fault}</td>
                            <td>${this.session}</td>
                         </tr>
                   `;
                });
                $("#player-data-main tbody").html(html);
                var RankObjs=$("#player-data-main tbody td:first-child>span:lt(5)");
                setRankStyle(RankObjs);
            }
        });
    }
    //请求球队数据
    function getTeamData(starti,orderBy) {
        $.ajax({
            type:'GET',
            data:{starti:starti,ppc:ppc,orderBy:orderBy},
            url:'php/select-team-data-detail.php',
            success:function (data) {
                // console.log(data);
                var html='';
                var firstRank=starti+1;//每页第一行排序号
                const session=82;//总场次
                $(data).each(function () {
                    html+=`
                            <tr>
                                <td>
                                    <span>${firstRank++}</span>
                                </td>
                                <td>
                                    <img src="images/team/${this.logo}" alt="">
                                    <span>${this.ch_tname}</span>
                                </td>
                                <td>${this.win}</td>
                                <td>${parseInt(this.win*100/session)+'%'}</td>
                                <td>${this.score}</td>
                                <td>${this.rebound}</td>
                                <td>${this.assist}</td>
                                <td>${this.ST}</td>
                                <td>${this.block_shot}</td>
                                <td>${this.fault}</td>
                                <td>${session}</td>
                            </tr>
                        `;
                });
                $("#team-data-main tbody").html(html);
                var RankObjs=$("#team-data-main tbody td:first-child>span:lt(5)");
                setRankStyle(RankObjs);
            }
        });
    }
    // 表头排序加载
    function thLoadData(self,getData,starti) {
        if(!self.hasClass('selected')){
            self.addClass("selected").siblings('.selected')
                .removeClass("selected");
            var orderBy=self.attr("name");
            getData(starti,orderBy);
        }
    }
    //  页码加载数据
    function pageLoadData(self,getData,orderBy){
        //页码对象、请求数据函数、排序方式
        if(!self.hasClass('selected')){
            self.addClass("selected").siblings().removeClass("selected");
            var beginCheckNum=(parseInt(self.text())-1)*ppc;
            getData(beginCheckNum,orderBy);
        }
    }
        //显示页码
    function setPage(obj,DataLength,ppc) {
        var pageCount= Math.ceil(DataLength/ppc);
        for (var i=0;i<pageCount;i++){
            obj.append($(`<li>${i+1}</li>`));
            obj.children().first().addClass('selected');
        }
        obj.css('width',(liWidth+offset)*pageCount+'px');//设置ul宽
        return pageCount;
    }

    //前5样式
    // var rankNo=$(".table tbody td:first-child>span:lt(5)");
    function setRankStyle(objs) {
        objs.each(function () {
            if($(this).text()==1){
                $(this).css('background','#F23D63');
            }else if($(this).text()==2){
                $(this).css('background','#0090EE');
            }else if($(this).text()==3||
                $(this).text()==4||
                $(this).text()==5){
                $(this).css('background','#606060');
            }
        });
    }

});//$fn over

