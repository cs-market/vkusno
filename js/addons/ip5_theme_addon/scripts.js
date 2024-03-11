(function(_, $) {
    
    $(document).on("click", ".ip5_mobile .ip5_account_info_title", function () {
        $(".ip5_account_info_body").removeClass("hidden")
        setTimeout(function () {
            $(".ip5_account_info_body").addClass("open")
            $("body").addClass("body-no-scroll")
        }, 200)
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
            $(".ip5_header .top-cart-content .ty-dropdown-box__content--cart .ty-cart-items-delete a").click();
    });

    $(window).on('resize',function(){
        var viewportWidth = $(window).outerWidth();
        // console.log(viewportWidth);
        //
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

    if ($(window).width() > 767) {
        var optionsHeight = $('.ty-product-detail .ty-product-block__wrapper .ty-product-block__img-wrapper').height();
        var formHeight = $('.ty-product-detail .ty-product-block__wrapper .ty-product-block__left > form').height();
        var tabsHeight = $('.ty-product-detail .ty-product-block__wrapper .ty-product-block__left .ty-tabs').height() + 28;
        $('.ty-product-detail .ty-product-block__wrapper .ty-product-block__left .ty-tabs__content > div').css({'max-height': optionsHeight - formHeight - tabsHeight});
    }


    $(document).on("click", ".ip5_catalog .ty-text-links .ty-text-links__item.ty-level-0", function () {
        var $this = $(this);
        var $submenu = $this.find('.ty-text-links');

        setTimeout(function () {
        if ($submenu.hasClass("open")) {
            setTimeout(function () {
                $submenu.removeClass("open");
                $this.removeClass("active");
            }, 50);
        } else {
            setTimeout(function () {
                $submenu.addClass("open");
                $this.addClass("active");
            }, 50);
        }
        }, 50);
        $submenu.animate({
            opacity: "toggle",
            height: "toggle"
        }, 300);
    });




}(Tygh, Tygh.$));
