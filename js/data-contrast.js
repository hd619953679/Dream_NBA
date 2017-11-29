    $(function () {


    //请求球队信息加入下拉列表
        $.ajax({
            type:'GET',
            url:'php/contrast/team-into-select.php',
            success:function (data) {
                var html='';
               $(data).each(function () {
                   html+=`
                        <li data-tid="${this.team_id}">${this.ch_tname}</li>
                   `;
               })
                $('#team1-menu').html(html);
                $('#team2-menu').html(html);
                $('#team1-menu>li:eq(15)').addClass('selected required');
                $('#team2-menu>li:eq(1)').addClass('selected required');
                showChoose();
                var teamId1=$('#team1-menu>li.selected').attr('data-tid');
                var teamId2=$('#team2-menu>li.selected').attr('data-tid');
                getPlayer(teamId1,$('#player1-menu'));
                getPlayer(teamId2,$('#player2-menu'));
                getTeamData(teamId1,teamId2);
                $('#contrast-team').addClass('required');
            }
        });

        //点击对比球队
        $('#contrast-team').click(function () {
            var teamId1=$('#team1-menu>li.selected').attr('data-tid');
            var teamId2=$('#team2-menu>li.selected').attr('data-tid');
            if(!$(this).hasClass('required')){
                getTeamData(teamId1,teamId2);
                $(this).addClass('required');
            }
            $('#contrast-player').removeClass('required');
        });
        //点击对比球员
        $('#contrast-player').click(function () {
            var playerId1=$('#player1-menu>li.selected').attr('data-pid');
            var playerId2=$('#player2-menu>li.selected').attr('data-pid');
            if(!$(this).hasClass('required')){
                getPlayerData(playerId1,playerId2);
                $(this).addClass('required');
            }
            $('#contrast-team').removeClass('required');
        });
        //获取球队数据并绘图
        function getTeamData(team1Id,team2Id) {
            $.ajax({
                type:'GET',
                data:{team1Id:team1Id,team2Id:team2Id},
                url:'php/contrast/team-data.php',
                success:function (data) {
                    // console.log(data);
                    showTeamData(data);
                }
            });
        }
        //获取球员数据并绘图
        function getPlayerData(player1Id,player2Id) {
            $.ajax({
                type:'GET',
                data:{player1Id:player1Id,player2Id:player2Id},
                url:'php/contrast/player-data.php',
                success:function (data) {
                    // console.log(data);
                    showPlayerData(data);
                }
            });
        }

        //4个下拉列表统一的样式事件
        $('.choose-dropMenu').on('click','li',function () {
            var oldtLi=$(this).parent().children('.selected').attr('data-tid');
            var oldpLi=$(this).parent().children('.selected').attr('data-pid');
            $(this).addClass('selected').siblings('.selected')
                .removeClass('selected');
            $(this).parent().css('height',0);
            showChoose();
            // console.log(oldLi);
            if(oldtLi!==$(this).attr('data-tid')){
                $("#contrast-player,#contrast-team").removeClass('required');
            }else if(oldpLi!==$(this).attr('data-pid')){
                $("#contrast-player").removeClass('required');
            }
        });

        $('.show-choose').click(function () {
            if($(this).next().css('height')==='0px'){
                $('.choose-dropMenu').css('height',0);
                $(this).next().css('height','150px');
            }else{
                $(this).next().css('height',0);
            }
        });

        //球队点击联动球员菜单
        $('#team1-menu,#team2-menu').on('click','li',function () {
            var teamId=$(this).attr('data-tid');
            var playerList=$(this).parent().parent()
                .next().children('.choose-dropMenu');
            if(!$(this).hasClass('required')){
                getPlayer(teamId,playerList)
                $(this).addClass('required').siblings('.required')
                    .removeClass('required');
            }
        })

        //选中显示在show-choose中
        function showChoose() {
            var selectedLi=$('.choose-dropMenu>li.selected')
            $(selectedLi).each(function () {
                var show=$(this).parent().prev();
                show.html($(this).html());
            });
        }

        //获取球员
        function getPlayer(teamId,obj) {
            $.ajax({
                type:'GET',
                url:'php/contrast/player-into-select.php?teamId='+teamId,
                success:function (data) {
                    var html='';
                    $(data).each(function () {
                        html+=`
                            <li data-pid="${this.pid}">${this.Chpname}</li>
                        `;
                    });
                    obj.html(html);
                    obj.children().eq(0).addClass('selected');
                    showChoose();
                }
            })
        }

        $("#random").click(function () {
            for(;;){
                var num1=Math.floor(Math.random()*30);
                var num2=Math.floor(Math.random()*30);
                if(num1!==num2)
                    break;
            }
            $("#team1-menu>li").eq(num1).addClass('selected')
                .siblings('.selected').removeClass('selected');
            $("#team2-menu>li").eq(num2).addClass('selected')
                .siblings('.selected').removeClass('selected');
            showChoose();
            var teamId1=$('#team1-menu>li.selected').attr('data-tid');
            var teamId2=$('#team2-menu>li.selected').attr('data-tid');
            getTeamData(teamId1,teamId2);
            getPlayer(teamId1,$("#player1-menu"));
            getPlayer(teamId2,$("#player2-menu"));
            $("#contrast-player").removeClass('required');
        });




        var ctx = document.getElementById("myChart").getContext("2d");
        Chart.defaults.scale.gridLines.color='rgba(202,202,202,0.3)';//设置网格线颜色
        Chart.defaults.scale.gridLines.lineWidth=0.4;//设置网格线宽度
        Chart.defaults.scale.ticks.display=false;//不显示刻度
        //展示球队数据
        function showTeamData(data) {
            const sSession=82;//总场次
            //左team1信息
            $("#logo-left").attr("src","images/team/"+data[1].logo);
            $("#ch-name-left").html(data[1].ch_tname);
            $("#en-name-left").html(data[1].en_tname);
            $("#info-left").html(data[1].win+"胜"+(sSession-data[1].win)+"负 / "
                +(data[1].location=='west'?'西部第':'东部第')+data[0][0]);
            //右team2信息
            $("#logo-right").attr("src","images/team/"+data[3].logo);
            $("#ch-name-right").html(data[3].ch_tname);
            $("#en-name-right").html(data[3].en_tname);
            $("#info-right").html(data[3].win+"胜"+(sSession-data[3].win)+"负 / "
                +(data[3].location=='west'?'西部第':'东部第')+data[2][0]);
            drawRadar(data,1,3,'ch_tname');
        }

        function showPlayerData(data) {
            //左team1信息
            $("#logo-left").attr("src","images/team-player/"+data[0].photo);
            $("#ch-name-left").html(data[0].Chpname);
            $("#en-name-left").html(data[0].Enpname);
            $("#info-left").html(data[0].num+" "+data[0].position+"/"+data[0].tall
            +"CM,"+data[0].weight+"KG");
            //右team2信息
            $("#logo-right").attr("src","images/team-player/"+data[1].photo);
            $("#ch-name-right").html(data[1].Chpname);
            $("#en-name-right").html(data[1].Enpname);
            $("#info-right").html(data[1].num+" "+data[1].position+"/"+data[1].tall
                +"CM,"+data[1].weight+"KG");
            drawRadar(data,0,1,'Chpname');
        }
        var myChart;
        var first=0;
        function drawRadar(data,index1,index2,label) {
            // 获取数据及索引、标题
            //chartsJs
            first++;

            if(first!==1){
                removeData(myChart);
                // console.log(data);
                addData(myChart,label,data,index1,index2);

            }else{
                myChart = new Chart(ctx, {
                    type: 'radar',
                    // backgroundColor:'#fff',
                    data: {
                        labels: ["得分", "篮板", "助攻", "抢断", "盖帽", "失误"],
                        datasets: [{
                            label: data[index1][label],
                            data: [
                                data[index1].score,
                                data[index1].rebound,
                                data[index1].assist,
                                data[index1].ST,
                                data[index1].block_shot,
                                data[index1].fault
                            ],
                            backgroundColor: [
                                'rgba(240,94,125,0.3)',
                            ],
                            borderColor: [
                                'rgba(240,94,125,1)',
                            ],
                            borderWidth: 1,
                            pointBackgroundColor:'#eee',
                            pointBorderColor:'rgba(255,99,132,0.6)',
                            pointHoverBorderWidth:3
                        },
                            {
                                label: data[index2][label],
                                data: [
                                    data[index2].score,
                                    data[index2].rebound,
                                    data[index2].assist,
                                    data[index2].ST,
                                    data[index2].block_shot,
                                    data[index2].fault
                                ],
                                backgroundColor: [
                                    'rgba(39,161,242,0.3)',
                                ],
                                borderColor: [
                                    'rgba(39,161,242,1)',
                                ],
                                borderWidth: 1,
                                pointBackgroundColor:'#eee',
                                pointBorderColor:'rgba(36,188,162,0.6)',
                                pointHoverBorderWidth:3
                            }
                        ]
                    },
                    options: {
                        responsive:true,
                        responsiveAnimationDuration:500,
                        scales: {
                            display:true
                        },
                        tooltips:{
                            intersect: true,//自动定位最近点
                            mode:'index',
                            titleFontSize:14,
                            titleMarginBottom:10,
                            bodyFontColor:"#faa",//提示框label字体颜色
                            bodySpacing:6,
                            displayColors:false,
                        }
                    }
                });
            }

        }


        function addData(chart,label, data,index1,index2) {
            var label=[data[index1][label],data[index2][label]];
            var result=[
                [
                    data[index1].score,
                    data[index1].rebound,
                    data[index1].assist,
                    data[index1].ST,
                    data[index1].block_shot,
                    data[index1].fault
                ],
                [
                    data[index2].score,
                    data[index2].rebound,
                    data[index2].assist,
                    data[index2].ST,
                    data[index2].block_shot,
                    data[index2].fault
                ]
            ];
            // console.log(data);
            for(var i=0;i<chart.data.datasets.length;i++){
                chart.data.datasets[i].label=label[i];
                for(var j=0;j<result[i].length;j++){
                    chart.data.datasets[i].data.push(result[i][j]);
                   // console.log( chart.data.datasets[i].data);
                }
            }
            chart.update();
        }
        function removeData(chart) {
            chart.data.datasets.forEach((dataset) => {
                dataset.label='';
                for(var j=0;j<6;j++) {
                    dataset.data.pop();
                }
                // console.log(dataset.data);
            });
            chart.update();
        }

    });//$fn over