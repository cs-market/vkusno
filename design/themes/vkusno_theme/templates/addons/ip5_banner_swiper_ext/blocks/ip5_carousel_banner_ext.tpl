{* block-description:ip5_carousel_extended *}

{if $items}

{assign var="obj_id" value=$obj_id|default:$items.banner_id}
{assign var="type_C" value=$items.type|default:"C"}
{assign var="type_V" value=$items.type|default:"V"}

{********************** Desktop banner *********************}
{include file='addons/ip5_banner_swiper_ext/blocks/desk_slider.tpl'}

{********************** Tablet banner *********************}
{include file='addons/ip5_banner_swiper_ext/blocks/tab_slider.tpl'}

{********************** Mobile banner *********************}
{include file='addons/ip5_banner_swiper_ext/blocks/mob_slider.tpl'}

{/if}



<div id="banner_swiper_{$block.grid_id}" class="swapBanner"></div>
{script src="js/addons/ip5_banner_swiper_ext/swiper.min.js" data-no-defer=true}
<script type="text/javascript">
    (function (_, $) {

        $.ceEvent('on', 'ce.window.resize', function () {
                _resize();
        });

        function _resize() {

            if ($(this).width() >= 1024) {
                $('#banner_swiper_{$block.grid_id}').html(" ")
                var swiperEl = $('#banner_swiper_{$block.grid_id} .swiper').length
                if (swiperEl == 0){
                    $('#banner_swiper_{$block.grid_id}').append('{if $items}<div id="banner_swiper_{$block.block_id}" class="swiper"><div class="swiper-wrapper">{$smarty.capture.desk_slider nofilter}</div>{if $block.properties.navigation == 'A' || $block.properties.arrows == "YesNo::YES"|enum}<div class="swiper-button-next"></div><div class="swiper-button-prev"></div>{/if}{if $block.properties.navigation == 'D' || 'P'}<div class="swiper-pagination"></div>{/if}</div>{/if}')
                }
            }else if( $(this).width() >= 768 && $(this).width() <= 1023){
                $('#banner_swiper_{$block.grid_id}').html(" ")
                var swiperEl = $('#banner_swiper_{$block.grid_id} .swiper').length
                if (swiperEl == 0){
                    $('#banner_swiper_{$block.grid_id}').append('{if $items}<div id="banner_swiper_{$block.block_id}" class="swiper"><div class="swiper-wrapper">{$smarty.capture.tab_slider nofilter}</div>{if $block.properties.navigation == 'A' || $block.properties.arrows == "YesNo::YES"|enum}<div class="swiper-button-next"></div><div class="swiper-button-prev"></div>{/if}{if $block.properties.navigation == 'D' || 'P'}<div class="swiper-pagination"></div>{/if}</div>{/if}')
                }
            }else {
                $('#banner_swiper_{$block.grid_id}').html(" ")
                var swiperEl = $('#banner_swiper_{$block.grid_id} .swiper').length
                if (swiperEl == 0){
                    $('#banner_swiper_{$block.grid_id}').append('{if $items}<div id="banner_swiper_{$block.block_id}" class="swiper"><div class="swiper-wrapper">{$smarty.capture.mob_slider nofilter}</div>{if $block.properties.navigation == 'A' || $block.properties.arrows == "YesNo::YES"|enum}<div class="swiper-button-next"></div><div class="swiper-button-prev"></div>{/if}{if $block.properties.navigation == 'D' || 'P'}<div class="swiper-pagination"></div>{/if}</div>{/if}')
                }
            }

            var swiper = new Swiper("#banner_swiper_{$block.block_id}", {
                centeredSlides: true,
                {if $block.properties.navigation == 'A' || $block.properties.arrows == "YesNo::YES"|enum}
                    navigation: {
                        nextEl: ".swiper-button-next",
                        prevEl: ".swiper-button-prev",
                    },
                {/if}
                {if $block.properties.navigation == 'D'}
                    pagination: {
                        el: ".swiper-pagination",
                        clickable: true,
                    },
                {/if}
                {if $block.properties.navigation == 'P'}
                pagination: {
                    el: ".swiper-pagination",
                    clickable: true,
                    renderBullet: function (index, className) {
                    return '<span class="' + className + '">' + (index + 1) + "</span>";
                    },
                },{/if}
                effect: {if $block.properties.fade == "YesNo::YES"|enum}'fade'{else}'slide'{/if},
                {if $block.properties.fade == "YesNo::YES"|enum}fadeeffect: {
                    crossfade: true,
                },{/if}
                loop: {if $block.properties.loop == "YesNo::YES"|enum}true{else}false{/if},

                {if $block.properties.autoplay == "YesNo::YES"|enum}autoplay: {
                    delay: {$block.properties.autoplaySpeed|default:3000},
                    pauseOnMouseEnter: false,
                    disableOnInteraction: true,
                },{/if}

                {if $block.properties.pauseOnHover == "YesNo::YES"|enum}
                autoplay: {
                    delay: {$block.properties.autoplaySpeed|default:3000},
                    disableOnInteraction: true,
                    pauseOnMouseEnter: true,
                },{/if}

                speed: {$block.properties.speed|default:600},
                lazy: {if $block.properties.lazyLoad == 'O'}true{else}false{/if},
                preloadImages: {if $block.properties.lazyLoad == 'P'}true{else}false{/if},
            });

            //$(".bg video").attr('autoplay', 'true');

        }
    })(Tygh, Tygh.$);
</script>