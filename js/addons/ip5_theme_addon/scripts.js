(function(_, $) {

    if ($(window).width() <= 767) {
        $(document).on("click", ".ip5_mobile .ip5_account_info_title", function () {
            $(".ip5_account_info_body").removeClass("hidden")
            $('.tygh-content').css({'z-index': "0"});
            $('.tygh-footer').css({'z-index': "0"});
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
                $('.tygh-content').css({'z-index': "initial"});
                $('.tygh-footer').css({'z-index': "99"});
            }, 200)
        });


        $(document).on("click", ".ip5_mobile .ip5_menu_title", function () {
            $(".ip5_menu_body").removeClass("hidden")
            $('.tygh-content').css({'z-index': "0"});
            $('.tygh-footer').css({'z-index': "0"});
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
                $('.tygh-content').css({'z-index': "initial"});
                $('.tygh-footer').css({'z-index': "99"});
            }, 200)
        });
    }

    $(document).on("click", ".ip5_header .top-cart-content .ty-dropdown-box__content--cart .ty-cart-top span", function () {
            $(".ip5_header .top-cart-content .ty-dropdown-box__content--cart .ty-cart-items-delete a").click();
    });

    // $(window).on('resize',function(){
    //     var viewportWidth = $(window).outerWidth();
    //     // console.log(viewportWidth);
    //     //
    //     // if ($("body").width() >= 1526 && $("body").width() <= 2549) {
    //     //     var viewportWidth = $(window).outerWidth();
    //     //     var zoom = viewportWidth / 2500;
    //     //     $('body').css('zoom', zoom);
    //     // }else
    //     if ($("body").width() >= 768 && $("body").width() <= 1525) {
    //         var viewportWidth = $(window).outerWidth();
    //         var zoom = viewportWidth / 1535;
    //         $('body').css('zoom', zoom);
    //     }
    // });

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


    $.ceEvent('on', 'ce.commoninit', function() {
        $('.ty-btn__add-to-cart').click(function() {
            $(this).closest('.cm-product-controls').addClass('in-cart').find('.ty-grid-list__qty').addClass('ty-cart-content__qty');
        });
    });



    document.addEventListener("DOMContentLoaded", function() {
        const valueChangerLinks = document.querySelectorAll('.ty-product-block__buy .ty-value-changer__increase, .ty-product-block__buy .ty-value-changer__decrease');
        const recalculateButton = document.querySelector('.ty-product-block__buy .ty-btn--recalculate-cart');

        var timeoutId;

        function handleClick() {
            clearTimeout(timeoutId);
            timeoutId = setTimeout(() => {
                recalculateButton.click();
            }, 1000);
        }

        valueChangerLinks.forEach(link => {
            link.addEventListener('click', handleClick);
        });
    });


    $(document).on("click", ".ip5_filter_btn", function (event) {
        event.stopPropagation();
        $(".uc-ip5_filter_body").removeClass("hidden")
        $(".ip5_filter_body").removeClass("hidden")
        $(".ty-ajax-overlay").addClass("active")
        setTimeout(function () {
            $(".ip5_filter_body").addClass("open")
            $("body").addClass("body-no-scroll")
        }, 300)
    });

    $(document).on("click", ".ip5_filter_close_btn", function () {
        $(".ip5_filter_body").removeClass("open")
        $("body").removeClass("body-no-scroll")
        setTimeout(function () {
            $(".ip5_filter_body").addClass("hidden")
            $(".uc-ip5_filter_body").addClass("hidden")
            $(".ty-ajax-overlay").removeClass("active")
        }, 300)
    });

    $(document).on("click", function(event) {
        if (!$(event.target).closest('.ip5_filter_body').length && !$(event.target).hasClass('ip5_filter_btn')) {
            $(".ip5_filter_body").removeClass("open")
            $("body").removeClass("body-no-scroll")
            setTimeout(function () {
                $(".ip5_filter_body").addClass("hidden")
                $(".uc-ip5_filter_body").addClass("hidden")
                $(".ty-ajax-overlay").removeClass("active")
            }, 300)
        }
    });

    if ($(window).width() <= 767) {
        $('.ip5_filter_mob').append( $('.ip5_catalog .ty-sort-container'));
    }


    if ($('.ip5_product .ty-order-products__list').length > 0) {
        var items = $('.ty-order-products__item');
        var showMore = $('.ip5_show_more');
        var showMoreBtn = $('.ip5_show_more span');

        if (items.length > 4) {
            var hiddenItems = items.slice(3);
            hiddenItems.hide();
            showMoreBtn.text('+' + hiddenItems.length);
            showMore.css({'display': "flex"});
            showMore.click(function(){
                hiddenItems.slideToggle(function(){
                    $(this).is(':visible');
                    showMore.hide();
                });
            });
        } else {
            showMore.hide();
        }
    }


    if ($('.ip5_checkout_content').length > 0) {
        document.addEventListener("DOMContentLoaded", function() {

            var calendarInput = document.querySelector(".ty-calendar__input");
            var helpMeSpan = document.querySelector(".ip5_date_update");

            // Функция для преобразования даты
            function formatDate(dateString) {
                var dateParts = dateString.split('/');
                var month = dateParts[0];
                var day = dateParts[1];
                var year = dateParts[2];

                // Убираем 0 перед числами от 1 до 9
                day = parseInt(day, 10);
                if (day < 10) {
                    day = day.toString();
                }

                var months = [
                    "января", "февраля", "марта",
                    "апреля", "мая", "июня", "июля",
                    "августа", "сентября", "октября",
                    "ноября", "декабря"
                ];

                var formattedDate = day + " " + months[parseInt(month) - 1];
                return formattedDate;
            }

            // Функция для определения разницы в днях между двумя датами
            function daysDifference(date1, date2) {
                var oneDay = 24 * 60 * 60 * 1000; // один день в миллисекундах
                var diffDays = Math.round(Math.abs((date1 - date2) / oneDay));
                return diffDays;
            }

            // Функция для обновления содержимого span
            function updateHelpMeSpan() {
                var inputValue = calendarInput.value;
                var inputDate = new Date(inputValue);
                var today = new Date();
                var tomorrow = new Date(today);
                tomorrow.setDate(tomorrow.getDate() + 1);
                var dayAfterTomorrow = new Date(today);
                dayAfterTomorrow.setDate(dayAfterTomorrow.getDate() + 2);

                var formattedDate = formatDate(inputValue);
                var difference = daysDifference(inputDate, today);

                if (inputDate.toDateString() === today.toDateString()) {
                    helpMeSpan.textContent = "Сегодня, " + formattedDate;
                } else if (inputDate.toDateString() === tomorrow.toDateString()) {
                    helpMeSpan.textContent = "Завтра, " + formattedDate;
                } else if (inputDate.toDateString() === dayAfterTomorrow.toDateString()) {
                    helpMeSpan.textContent = "Послезавтра, " + formattedDate;
                } else if (difference >= 0) {
                    helpMeSpan.textContent = formattedDate;
                }
            }

            // Запуск функции обновления span каждые 100 мс
            setInterval(updateHelpMeSpan, 100);
        });


        $(document).ajaxSuccess(function () {
            var calendarInput = document.querySelector(".ty-calendar__input");
            var helpMeSpan = document.querySelector(".ip5_date_update");

            // Функция для преобразования даты
            function formatDate(dateString) {
                var dateParts = dateString.split('/');
                var month = dateParts[0];
                var day = dateParts[1];
                var year = dateParts[2];

                // Убираем 0 перед числами от 1 до 9
                day = parseInt(day, 10);
                if (day < 10) {
                    day = day.toString();
                }

                var months = [
                    "января", "февраля", "марта",
                    "апреля", "мая", "июня", "июля",
                    "августа", "сентября", "октября",
                    "ноября", "декабря"
                ];

                var formattedDate = day + " " + months[parseInt(month) - 1];
                return formattedDate;
            }

            // Функция для определения разницы в днях между двумя датами
            function daysDifference(date1, date2) {
                var oneDay = 24 * 60 * 60 * 1000; // один день в миллисекундах
                var diffDays = Math.round(Math.abs((date1 - date2) / oneDay));
                return diffDays;
            }

            // Функция для обновления содержимого span
            function updateHelpMeSpan() {
                var inputValue = calendarInput.value;
                var inputDate = new Date(inputValue);
                var today = new Date();
                var tomorrow = new Date(today);
                tomorrow.setDate(tomorrow.getDate() + 1);
                var dayAfterTomorrow = new Date(today);
                dayAfterTomorrow.setDate(dayAfterTomorrow.getDate() + 2);

                var formattedDate = formatDate(inputValue);
                var difference = daysDifference(inputDate, today);

                if (inputDate.toDateString() === today.toDateString()) {
                    helpMeSpan.textContent = "Сегодня, " + formattedDate;
                } else if (inputDate.toDateString() === tomorrow.toDateString()) {
                    helpMeSpan.textContent = "Завтра, " + formattedDate;
                } else if (inputDate.toDateString() === dayAfterTomorrow.toDateString()) {
                    helpMeSpan.textContent = "Послезавтра, " + formattedDate;
                } else if (difference >= 0) {
                    helpMeSpan.textContent = formattedDate;
                }
            }

            // Запуск функции обновления span каждые 100 мс
            setInterval(updateHelpMeSpan, 100);
        });

        $(document).ajaxSuccess(function () {
            if ($(window).width() <= 767) {
                if ($('.ip5_checkout_content form.litecheckout__payment-methods .ip5-total_content .ip5-total_body .ty-checkout-summary').length == 0) {
                    $(".ip5_checkout_content form.litecheckout__payment-methods .ip5-total_content .ip5-total_body").append($('.ty-checkout-summary'));
                }
            }
        });


        if ($(window).width() <= 767) {
            $('.ip5_checkout_content .span4.ip5_total *').remove();
        }
        if ($(window).width() > 767) {
            $('.ip5_checkout_content .litecheckout__group .ip5-total_content *').remove();
        }
    }


    if ($(window).width() > 767) {
        if ($('.ip5_checkout_content').length > 0) {
            $(document).on("click", ".ip5_submit_checkout_btn", function () {
                $('.litecheckout__submit-order button.litecheckout__submit-btn').click()
            });

            $(document).ajaxSuccess(function() {
                $(document).on("click", ".ip5_submit_checkout_btn", function () {
                    $('.litecheckout__submit-order button.litecheckout__submit-btn').click()
                });
            });
        }
    }

    if ($('.ip5_orders_page .ty-orders-search .ty-order-items').length > 0) {

        if ($(window).width() > 767) {
            $('.ty-order-items').each(function () {
                var $orderItems = $(this).find('.ty-order-items__list-item-image');
                var $showMore = $(this).find('.ip5_show_more');
                var $showMoreBtn = $(this).find('.ip5_show_more span');

                if ($orderItems.length > 6) {
                    var $hiddenItems = $orderItems.slice(5);
                    $hiddenItems.hide();
                    $showMoreBtn.text('+' + $hiddenItems.length);
                    $showMore.css({'display': "flex"});
                    $showMore.click(function(){
                        $hiddenItems.slideToggle(function(){
                            $(this).is(':visible');
                            $showMore.hide();
                        });
                    });
                } else {
                    $showMore.hide();
                }
            });
        }else {
            $('.ty-order-items').each(function () {
                var $orderItems = $(this).find('.ty-order-items__list-item-image');
                var $showMore = $(this).find('.ip5_show_more');
                var $showMoreBtn = $(this).find('.ip5_show_more span');

                if ($orderItems.length > 4) {
                    var $hiddenItems = $orderItems.slice(3);
                    $hiddenItems.hide();
                    $showMoreBtn.text('+' + $hiddenItems.length);
                    $showMore.css({'display': "flex"});
                    $showMore.click(function(){
                        $hiddenItems.slideToggle(function(){
                            $(this).is(':visible');
                            $showMore.hide();
                        });
                    });
                } else {
                    $showMore.hide();
                }
            });
        }

    }







}(Tygh, Tygh.$));
