(function(_, $) {
    
    $(document).on("click", ".ip5_mobile .ip5_account_info_title", function () {
        $(".ip5_account_info_body").removeClass("hidden")
        setTimeout(function () {
            $(".ip5_account_info_body").addClass("open")
            $("body").addClass("body-no-scroll")
        }, 200)

        // $(".header-grid").after('<div class="ui-widget-overlay ui-front sms_block_overlay" style="z-index: 1100;"></div>');

    });

    $(document).on("click", ".ip5_mobile .ip5_account_info_body .ip5_close_btn", function () {
        $(".ip5_account_info_body").removeClass("open")
        $("body").removeClass("body-no-scroll")
        setTimeout(function () {
            $(".ip5_account_info_body").addClass("hidden")
        }, 200)
    });


    $(document).on("click", ".ip5_mobile .ip5_menu_title", function () {
        $(".ip5_menu_body").removeClass("hidden")
        setTimeout(function () {
            $(".ip5_menu_body").addClass("open")
            $("body").addClass("body-no-scroll")
        }, 200)
    });

    $(document).on("click", ".ip5_mobile .ip5_menu_body .ip5_close_btn", function () {
        $(".ip5_menu_body").removeClass("open")
        $("body").removeClass("body-no-scroll")
        setTimeout(function () {
            $(".ip5_menu_body").addClass("hidden")
        }, 200)
    });

    $(document).on("click", ".ip5_header .top-cart-content .ty-dropdown-box__content--cart .ty-cart-top span", function () {
        // setTimeout(function () {
            $(".ip5_header .top-cart-content .ty-dropdown-box__content--cart .ty-cart-items-delete a").click();
        // }, 200)
    });

    $(window).on('resize',function(){
        var viewportWidth = $(window).outerWidth();
        // console.log(viewportWidth);

        // if ($("body").width() >= 1526 && $("body").width() <= 2549) {
        //     var viewportWidth = $(window).outerWidth();
        //     var zoom = viewportWidth / 2500;
        //     $('body').css('zoom', zoom);
        // }else
            if ($("body").width() >= 768 && $("body").width() <= 1525) {
            var viewportWidth = $(window).outerWidth();
            var zoom = viewportWidth / 1535;
            $('body').css('zoom', zoom);
        }
    });


}(Tygh, Tygh.$));
