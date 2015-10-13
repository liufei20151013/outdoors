function selectProject(){
          var collStyles = [['选择类型'],
					        ['潜泳','水下定向','水下摄影','游泳','跳水','水球','漂流'],
					        ['冲浪','滑水','风帆','舢舨','帆船','游艇','摩托艇','水上摩托','海上漂流'],
					        ['散步','行军','跑步','暴走','定向越野','猎狐'],
					        ['公路车长途','山地车越野','小轮车机动','山地速降'],
							['徒步登山','山地穿越','攀爬登山','攀登雪山','滑雪','岩降','溪降','攀岩','攀石','器械攀登','探洞'],
                            ['野营露宿','打猎野炊','采集花草','模拟野战','拓展训练','荒岛生存'],
                            ['钓鱼','捕鱼捉蟹','捉蟮逮鼠','捉虫捕蝶','烧烤烹调'],
                            ['摄影写生','地质考察','采集矿石','调查民俗','考察古迹','采访奇闻'],
                            ['山地越野','公路竞赛','长途旅游','赛车','探险','滑冰','旱冰','滑板','蹦极','岩跳'],
                            ['跳伞','滑翔伞','动力伞','热气球','滑翔机','超轻型飞机'],
                            ['骑行','球类','放风筝','旅游','度假','团体游戏','汽枪','打猎','射箭','镖弩','彩弹野战']];

        //获取两个下拉菜单对象
        var oSelNode = document.getElementById("selId");
        var oSubSelNode = document.getElementById("SubSelid");

        //获取选择的户外项目
        var index = oSelNode.selectedIndex;

        //通过角标到容器获取对应的类型数组
        var arrStyles =collStyles[index]; 
        //arrStyles[0].style.background = "#FFC0CB";

        //将子菜单中的内容清空一下
        for (var i = 1; i < oSubSelNode.options.length;) {
        	oSubSelNode.options[i].remove();
        }

        //清除动作
       // oSubSelNode.length = 0;
       

        //遍历这个数组，将这个数组的元素封装成option对象，添加到子菜单中

        for (var i = 0; i < arrStyles.length; i++) {
        	var oOptionNode = document.createElement("option");
        	oOptionNode.innerHTML = arrStyles[i];
        	oSubSelNode.appendChild(oOptionNode);
        }
       // oOptionNode[0].style.background = "#FFC0CB";
      }

    /*  function tarea_display(){
        //获取div节点
        var oDivNode = document.getElementById("idea_write");
        //获取textarea节点
        var oTextNode = document.getElementById("mood_write");
        //div里面的提示性文字消失
        oDivNode.innerHTML = "";
        //textarea出现，使用户可以编辑文字
        oTextNode.style.display = "block";
      }*/