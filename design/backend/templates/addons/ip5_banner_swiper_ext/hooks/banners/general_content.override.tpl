{strip}
    <input type="hidden" class="cm-no-hide-input" id="selected_section" name="selected_section"
        value="{$selected_section}" />
    <div class="control-group">
        <label for="elm_banner_name" class="control-label cm-required">{__("name")}</label>
        <div class="controls">
            <input type="text" name="banner_data[banner]" id="elm_banner_name" value="{$banner.banner}" size="25"
                class="input-large" />
        </div>
    </div>
    {if "ULTIMATE"|fn_allowed_for}
        {include file="views/companies/components/company_field.tpl"
            name="banner_data[company_id]"
            id="banner_data_company_id"
            selected=$banner.company_id
        }
    {/if}
    <div class="control-group">
        <label for="elm_banner_position" class="control-label">{__("position_short")}</label>
        <div class="controls">
            <input type="text" name="banner_data[position]" id="elm_banner_position" value="{$banner.position|default:"0"}" size="3" />
        </div>
    </div>

    <script>
        function ip5__change_banner_type() {

            var type_ip5_graphic = '{"IP5BannerTypes::IP5_GRAPHIC"|enum}';
            var type_ip5_video = '{"IP5BannerTypes::IP5_VIDEO"|enum}';
            var type_graphic = '{"IP5BannerTypes::GRAPHIC"|enum}';
            var type_text = '{"IP5BannerTypes::TEXT"|enum}';

            var fields_graphic = $('#banner_graphic, #banner_url, #banner_target');
            var fields_text = $('#banner_text');

            var type = $('#elm_banner_type').val();
            
            if (type === type_ip5_graphic) {
                $('#ip5banner_' + type_ip5_graphic).show();
                $('#ip5banner_' + type_ip5_video).hide();
                fields_graphic.hide();
                fields_text.hide();
            } else if  (type === type_ip5_video) {
                $('#ip5banner_' + type_ip5_video).show();
                $('#ip5banner_' + type_ip5_graphic).hide();
                fields_graphic.hide();
                fields_text.hide();
            } else if (type === type_graphic) {
                $('#ip5banner_' + type_ip5_graphic).hide();
                $('#ip5banner_' + type_ip5_video).hide();
                fields_graphic.show();
                fields_text.hide();
            } else {
                $('#ip5banner_' + type_ip5_graphic).hide();
                $('#ip5banner_' + type_ip5_video).hide();
                fields_graphic.hide();
                fields_text.show();
            }
        }
        $(document).ready(function() {
            ip5__change_banner_type();
        });
    </script>

    <div class="control-group">
        <label for="elm_banner_type" class="control-label cm-required">{__("type")}</label>
        <div class="controls">
            <select name="banner_data[type]" id="elm_banner_type" onchange="ip5__change_banner_type();" class="span5">
                <option {if $banner.type == "IP5BannerTypes::TEXT"|enum}selected="selected"{/if} value="{"IP5BannerTypes::TEXT"|enum}">{__("text_banner")}</option>
                <option {if $banner.type == "IP5BannerTypes::GRAPHIC"|enum}selected="selected"{/if} value="{"IP5BannerTypes::GRAPHIC"|enum}">{__("graphic_banner")}</option>
                <option {if $banner.type == "IP5BannerTypes::IP5_GRAPHIC"|enum}selected="selected"{/if} value="{"IP5BannerTypes::IP5_GRAPHIC"|enum}">{__("ip5_banner.type.graphic")}</option>
                <option {if $banner.type == "IP5BannerTypes::IP5_VIDEO"|enum}selected="selected"{/if} value="{"IP5BannerTypes::IP5_VIDEO"|enum}">{__("ip5_banner.type.video")}</option>
            </select>
        </div>
    </div>
    <div class="control-group hidden" id="banner_graphic">
        <label class="control-label">{__("image")}</label>
        <div class="controls">
            {include file="common/attach_images.tpl"
                image_name="banners_main" 
                image_object_type="promo" 
                image_pair=$banner.main_pair 
                image_object_id=$id 
                no_detailed=true 
                hide_titles=true
            }
        </div>
    </div>
    <div class="control-group hidden" id="banner_text">
        <label class="control-label" for="elm_banner_description">{__("description")}:</label>
        <div class="controls">
            <textarea id="elm_banner_description" name="banner_data[description]" cols="35" rows="8"
                class="cm-wysiwyg input-large">{$banner.description}</textarea>
        </div>
    </div>
    <div class="control-group hidden" id="banner_target">
        <label class="control-label" for="elm_banner_target">{__("open_in_new_window")}</label>
        <div class="controls">
            <input type="hidden" name="banner_data[target]" value="T" />
            <input type="checkbox" name="banner_data[target]" id="elm_banner_target" value="B"
                {if $banner.target == "B"}checked="checked" {/if} />
        </div>
    </div>
    <div class="control-group hidden" id="banner_url">
        <label class="control-label" for="elm_banner_url">{__("url")}:</label>
        <div class="controls">
            <input type="text" name="banner_data[url]" id="elm_banner_url" value="{$banner.url}" size="25"
                class="input-large" />
        </div>
    </div>
    <div class="control-group hidden">
        <label class="control-label" for="elm_banner_timestamp_{$id}">{__("creation_date")}</label>
        <div class="controls">
            {include file="common/calendar.tpl" 
                date_id="elm_banner_timestamp_`$id`" 
                date_name="banner_data[timestamp]" 
                date_val=$banner.timestamp|default:$smarty.const.TIME 
                start_year=$settings.Company.company_start_year
            }
        </div>
    </div>
    {include file="views/localizations/components/select.tpl" 
        data_name="banner_data[localization]" 
        data_from=$banner.localization
    }
    {include file="common/select_status.tpl" 
        input_name="banner_data[status]" 
        id="elm_banner_status" 
        obj_id=$id obj=$banner hidden=true
    }
{/strip}