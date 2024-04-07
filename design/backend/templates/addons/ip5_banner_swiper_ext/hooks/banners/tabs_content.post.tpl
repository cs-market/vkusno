{if $banner.type|in_array:["IP5BannerTypes::IP5_GRAPHIC"|enum, "IP5BannerTypes::IP5_VIDEO"|enum]}


    <script>
        function ip5__change_enable_device() {

            var section_ip5 = "ip5_graphic_settings";
            $('#nav_' + section_ip5 + '_tablet').hide();
            if ($('#elm_' + section_ip5 + '_enable_tablet').is(':checked')) {
                $('#nav_' + section_ip5 + '_tablet').show();
            } else if ($('#nav_' + section_ip5 + '_tablet').hasClass('active') && !$('#nav_' + section_ip5 + '_tablet').is(':visible')) {
                $('#nav_' + section_ip5 + '_desktop').click();
            }
            $('#nav_' + section_ip5 + '_mobile').hide();
            if ($('#elm_' + section_ip5 + '_enable_mobile').is(':checked')) {
                $('#nav_' + section_ip5 + '_mobile').show();
            } else if ($('#nav_' + section_ip5 + '_mobile').hasClass('active') && !$('#nav_' + section_ip5 + '_mobile').is(':visible')) {
                $('#nav_' + section_ip5 + '_desktop').click();
            }

            var section_ip5 = "ip5_video_settings";
            $('#nav_' + section_ip5 + '_tablet').hide();
            if ($('#elm_' + section_ip5 + '_enable_tablet').is(':checked')) {
                $('#nav_' + section_ip5 + '_tablet').show();
            } else if ($('#nav_' + section_ip5 + '_tablet').hasClass('active') && !$('#nav_' + section_ip5 + '_tablet').is(':visible')) {
                $('#nav_' + section_ip5 + '_desktop').click();
            }
            $('#nav_' + section_ip5 + '_mobile').hide();
            if ($('#elm_' + section_ip5 + '_enable_mobile').is(':checked')) {
                $('#nav_' + section_ip5 + '_mobile').show();
            } else if ($('#nav_' + section_ip5 + '_mobile').hasClass('active') && !$('#nav_' + section_ip5 + '_mobile').is(':visible')) {
                $('#nav_' + section_ip5 + '_desktop').click();
            }
        }
        $(document).ready(function() {
            ip5__change_enable_device();
        });
    </script>


    <div class="hidden" id="content_ip5banner_{"IP5BannerTypes::IP5_GRAPHIC"|enum}">
        {include file="common/subheader.tpl" meta="" title=__("ip5_banner.type.graphic")}

        {assign var="banner_type" value="graphic"}
        {assign var="banner_type_symbol" value="IP5BannerTypes::IP5_GRAPHIC"|enum}
        {assign var="section" value="ip5_graphic_settings"}
        {assign var="banner_settings" value=$banner.$section}

        <div class="control-group" id="{$section}_enable_tablet">
            <label for="elm_{$section}_enable_tablet" class="control-label">{__("ip5_banner.params.enable_tablet")}</label>
            <div class="controls">
                <input type="hidden" name="banner_data[{$section}][enable_tablet]" value="{"YesNo::NO"|enum}" />
                <input type="checkbox" name="banner_data[{$section}][enable_tablet]" id="elm_{$section}_enable_tablet" value="{"YesNo::YES"|enum}"
                    {if $banner_settings.enable_tablet == "YesNo::YES"|enum} checked="checked" {/if} onchange="ip5__change_enable_device();"/>
            </div>
        </div>

        <div class="control-group" id="{$section}_enable_mobile">
            <label for="elm_{$section}_enable_mobile" class="control-label">{__("ip5_banner.params.enable_mobile")}</label>
            <div class="controls">
                <input type="hidden" name="banner_data[{$section}][enable_mobile]" value="{"YesNo::NO"|enum}" />
                <input type="checkbox" name="banner_data[{$section}][enable_mobile]" id="elm_{$section}_enable_mobile" value="{"YesNo::YES"|enum}"
                    {if $banner_settings.enable_mobile == "YesNo::YES"|enum} checked="checked" {/if} onchange="ip5__change_enable_device();"/>
            </div>
        </div>

        <div class="tabs cm-j-tabs">
            <ul class="nav nav-tabs">
                <li id="nav_{$section}_desktop" class="cm-js active"><a>{__("ip5_banner.tabs.desktop")}</a></li>
                <li id="nav_{$section}_tablet" class="cm-js"><a>{__("ip5_banner.tabs.tablet")}</a></li>
                <li id="nav_{$section}_mobile" class="cm-js"><a>{__("ip5_banner.tabs.mobile")}</a></li>
            </ul>
        </div>

        <div class="cm-tabs-content" id="tabs_content_nav_{$section}">
            <div class="cm-tabs-content" id="content_nav_{$section}_desktop">
                {include file="addons/ip5_banner_swiper_ext/views/banners/components/tabs_`$banner_type_symbol`.tpl" section=$section device="desktop" banner_settings=$banner_settings banner_type=$banner_type}
            </div>

            <div class="cm-tabs-content hidden" id="content_nav_{$section}_tablet">
                {include file="addons/ip5_banner_swiper_ext/views/banners/components/tabs_`$banner_type_symbol`.tpl" section=$section device="tablet" banner_settings=$banner_settings banner_type=$banner_type}
            </div>

            <div class="cm-tabs-content hidden" id="content_nav_{$section}_mobile">
            {include file="addons/ip5_banner_swiper_ext/views/banners/components/tabs_`$banner_type_symbol`.tpl" section=$section device="mobile" banner_settings=$banner_settings banner_type=$banner_type}
            </div>
        </div>
    </div>

    <div class="hidden" id="content_ip5banner_{"IP5BannerTypes::IP5_VIDEO"|enum}">
        {include file="common/subheader.tpl" meta="" title=__("ip5_banner.type.video")}
        
        {assign var="banner_type" value="video"}
        {assign var="banner_type_symbol" value="IP5BannerTypes::IP5_VIDEO"|enum}
        {assign var="section" value="ip5_video_settings"}
        {assign var="banner_settings" value=$banner.$section}

        <div class="control-group" id="{$section}_enable_tablet">
            <label for="elm_{$section}_enable_tablet" class="control-label">{__("ip5_banner.params.enable_tablet")}</label>
            <div class="controls">
                <input type="hidden" name="banner_data[{$section}][enable_tablet]" value="{"YesNo::NO"|enum}" />
                <input type="checkbox" name="banner_data[{$section}][enable_tablet]" id="elm_{$section}_enable_tablet" value="{"YesNo::YES"|enum}"
                    {if $banner_settings.enable_tablet == "YesNo::YES"|enum} checked="checked" {/if} onchange="ip5__change_enable_device();"/>
            </div>
        </div>

        <div class="control-group" id="{$section}_enable_mobile">
            <label for="elm_{$section}_enable_mobile" class="control-label">{__("ip5_banner.params.enable_mobile")}</label>
            <div class="controls">
                <input type="hidden" name="banner_data[{$section}][enable_mobile]" value="{"YesNo::NO"|enum}" />
                <input type="checkbox" name="banner_data[{$section}][enable_mobile]" id="elm_{$section}_enable_mobile" value="{"YesNo::YES"|enum}"
                    {if $banner_settings.enable_mobile == "YesNo::YES"|enum} checked="checked" {/if} onchange="ip5__change_enable_device();"/>
            </div>
        </div>

        <div class="tabs cm-j-tabs">
            <ul class="nav nav-tabs">
                <li id="nav_{$section}_desktop" class="cm-js active"><a>{__("ip5_banner.tabs.desktop")}</a></li>
                <li id="nav_{$section}_tablet" class="cm-js"><a>{__("ip5_banner.tabs.tablet")}</a></li>
                <li id="nav_{$section}_mobile" class="cm-js"><a>{__("ip5_banner.tabs.mobile")}</a></li>
            </ul>
        </div>

        <div class="cm-tabs-content" id="tabs_content_nav_{$section}">
            <div class="cm-tabs-content" id="content_nav_{$section}_desktop">
                {include file="addons/ip5_banner_swiper_ext/views/banners/components/tabs_`$banner_type_symbol`.tpl" section=$section device="desktop" banner_settings=$banner_settings banner_type=$banner_type}
            </div>

            <div class="cm-tabs-content hidden" id="content_nav_{$section}_tablet">
                {include file="addons/ip5_banner_swiper_ext/views/banners/components/tabs_`$banner_type_symbol`.tpl" section=$section device="tablet" banner_settings=$banner_settings banner_type=$banner_type}
            </div>

            <div class="cm-tabs-content hidden" id="content_nav_{$section}_mobile">
            {include file="addons/ip5_banner_swiper_ext/views/banners/components/tabs_`$banner_type_symbol`.tpl" section=$section device="mobile" banner_settings=$banner_settings banner_type=$banner_type}
            </div>
        </div>
    </div>

{/if}