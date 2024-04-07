<div class="control-group">
    <label 
        for="elm_{$section}_{$device}_{$field}"
        class="control-label">{__("ip5_banner.params.{$field}")}
        {include file="common/tooltip.tpl" tooltip=__("ip5_banner.params.{$field}.tooltip")}
    </label>
    <div class="controls">

        {assign var="field_use" value="`$field`_use"}

        <input type="hidden" name="banner_data[{$section}][{$device}][{$field_use}]" value="N" />
        <input type="checkbox" name="banner_data[{$section}][{$device}][{$field}_use]" id="elm_{$section}_{$device}_{$field_use}" value="Y"{if $banner_settings.$device.$field_use == "Y"} checked="checked"{/if} style="margin: 5px 5px 10px 0;"/>

        {include file="views/theme_editor/components/colorpicker.tpl" cp_name="banner_data[`$section`][`$device`][`$field`]" cp_id="elm_{$section}_{$device}_{$field}" cp_value=$banner_settings.$device.$field|default:$default}

    </div>
</div>