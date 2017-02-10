$(document).on('turbolinks:load', function() {
    $(".selectpicker").selectpicker();

    $('.ckeditor:visible').each(function() {
        var id = $(this).attr('id');
        if (!CKEDITOR.instances[id]) {
            CKEDITOR.replace(id);
        }
    });

    $('li.nav > a').click(function() {
        if ($(this).is(':focus')) {
            $(this).blur();
        }
    });

    $('.list-group-item a').click(function() {
        event.preventDefault();
        $(this).parent().toggleClass("active");
        if ($(this).siblings("#userclassroomship_user_id_").prop('checked') == true) {
            $(this).siblings("#userclassroomship_user_id_").prop('checked', false);
        } else {
            $(this).siblings("#userclassroomship_user_id_").prop('checked', true);
        }
    });

    $('a.panel-title').click(function() {
        event.preventDefault();
        $(this).children('.fa').toggleClass('hidden');
        $(this).parent().next().toggleClass("hidden");
    });

    $('a.select-all-btn').click(function() {
        event.preventDefault();
        $(this).toggleClass('hidden');
        $(this).siblings('a').toggleClass("hidden");
        $(this).siblings('.panel').children('ul').children('li').addClass('active');
        $(this).siblings('.panel').children('ul').children('li').children('input').prop('checked', true)
    });

    $('a.select-cancel-btn').click(function() {
        event.preventDefault();
        $(this).toggleClass('hidden');
        $(this).siblings('a').toggleClass("hidden");
        $(this).siblings('.panel').children('ul').children('li').removeClass('active');
        $(this).siblings('.panel').children('ul').children('li').children('input').prop('checked', false)
    });
    $('a.return-history-title').click(function() {
        event.preventDefault();
        $(this).parent().siblings('.panel-body').toggleClass('hidden');
        $(this).children().children('.fa').toggleClass('hidden');
    });

    $('a.userclassroomship-link').click(function() {
        event.preventDefault();
        $(this).parent().parent().toggleClass("userclassroomship-active");
        $(this).parent().parent().children('td.userclassroomship-checkbox').children().children(".fa").toggleClass('hidden');
        if ($(this).parent().parent().children('td.userclassroomship-checkbox').children().children("#userclassroomship_user_id_").prop('checked') == true) {
            $(this).parent().parent().children('td.userclassroomship-checkbox').children().children("#userclassroomship_user_id_").prop('checked', false)
        } else {
            $(this).parent().parent().children('td.userclassroomship-checkbox').children().children("#userclassroomship_user_id_").prop('checked', true);
        }
    });

    $('a.userclassroomship.select-all-btn').click(function() {
        $('table.userclassroomship-table tr.userclassroomship-tr').addClass('userclassroomship-active');
        $('.userclassroomship-checkbox').children().children('input').prop('checked', true);
        $('.userclassroomship-checkbox').children().children('i').removeClass('hidden');
    });

    $('a.userclassroomship.select-cancel-btn').click(function() {
        $('table.userclassroomship-table tr.userclassroomship-tr').removeClass('userclassroomship-active');
        $('.userclassroomship-checkbox').children().children('input').prop('checked', false);
        $('.userclassroomship-checkbox').children().children('i').addClass('hidden');
    });

    $('#facebook-login-btn').click(function() {
        event.preventDefault();
        FB.login(function(response) {
            if (response.status === 'connected') {
                FB.api('/me?fields=id,name,email', function(response) {
                    var myurl = window.location.href;
                    var myemail = 'email=' + response.email + '&'
                    var myid = 'uid=' + response.id + '&'
                    var myname = 'name=' + response.name
                    var rooturl = window.location.toString().replace(/^(.*\/\/[^\/?#]*).*$/, "$1")
                    document.location.href = rooturl + '/facebooktrans/code?' + myemail + myid + myname
                });
                // Logged into your app and Facebook.
            } else {
                alert('授權失敗，您必須同意才能使用Facebook資料註冊登入！')
            }
        }, { scope: 'email' });
    });

});
