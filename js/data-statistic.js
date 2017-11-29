
$(function () {


    var title=['场均得分','场均篮板','场均助攻',
        '场均抢断','场均盖帽','场均失误'];
    var dataList=['score','rebound','assist',
        'ST','block_shot','fault'];
    //请求球队数据
    $.ajax({
        type:'GET',
        url:'php/select-team-data.php',
        success:function (data) {
           // console.log(data);
            var html='';
            for(var i=0;i<data.length;i++){
                html+=`
                       <div class="col-md-4 col-sm-6 col-xs-12">
                            <div class="title">${title[i]}</div>
                                <ul class="score data-list">
                  `;
                for(var j=0;j<data[i].length;j++){
                    html+=`
                            <li>
                                <div class="num">${j+1}</div>
                                <div class="p-img"><img src="images/team/${data[i][j].logo}" alt=""></div>
                                <div class="p-info">
                                    <h5 class="name">${data[i][j].ch_tname}</h5>
                                </div>
                                <div class="person-score">${data[i][j][dataList[i]]}</div>
                            </li>
                        `;
                }
                html+="</ul></div>";
            }
            $("#team-data-main").html(html);
        }
    });
    //请求球员数据
    $.ajax({
        type:'GET',
        url:'php/select-player-data.php',
        success:function (data) {
            // console.log(data);
            var html='';
            for(var i=0;i<data.length;i++){
                html+=`
                       <div class="col-md-4 col-sm-6 col-xs-12">
                            <div class="title">${title[i]}</div>
                                <ul class="score data-list">
                  `;
                for(var j=0;j<data[i].length;j++){
                    html+=`
                         <li>
                            <div class="num">${j+1}</div>
                            <div class="p-img"><img src="images/team-player/${data[i][j].photo}" alt=""></div>
                            <div class="p-info">
                                <h5 class="name">${data[i][j].Chpname}</h5>
                                <h6 class="position">
                                    <span>${data[i][j].num} /</span>
                                    <span>${data[i][j].position}</span>
                                </h6>
                                <h6 class="from">${data[i][j].ch_tname}</h6>
                            </div>
                            <div class="person-score">${data[i][j][dataList[i]]}</div>
                        </li>
                    `;
                }
                html+="</ul></div>";
            }
            $("#player-data-main").html(html);
        }
    });



    $("a.data-tab").click(function (e) {
        e.preventDefault();
        $(this).addClass('active').siblings('.active')
            .removeClass('active');
        var href=$(this).attr('href');
        $("#"+href).addClass('active').siblings('.active')
            .removeClass('active');
    });


});  //$fn over