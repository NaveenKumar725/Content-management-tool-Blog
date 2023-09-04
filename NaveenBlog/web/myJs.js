//function doLike(pid, uid) {
//    alert(pid + "," + uid);
//
//}
 function doLike(pid, uid) {
//    alert(pid + "," + uid);

                const d = {
                    pid: pid,
                    uid: uid,
                    operation: 'like'
                };
                $.ajax({
                    url:"Likeservlet",
                    data:d ,
                    success: function(data, textStatus , jqXHR){
                        console.log(data);
                        if($.trim(data) !== 'false'){
                            let c=$(".like-counter").html();
                            c++;
                            $(".like-counter").html(c);
                        }
                    },
                     error: function( jqXHR, textStatus , errorThrown){
                        console.log(data);
                    }
                });
            }