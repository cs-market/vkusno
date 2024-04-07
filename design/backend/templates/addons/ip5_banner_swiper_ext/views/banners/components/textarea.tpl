<div class="control-group">
    <label 
        for="elm_{$section}_{$device}_{$field}"
        class="control-label">{__("ip5_banner.params.{$field}")}
        {include file="common/tooltip.tpl" tooltip=__("ip5_banner.params.{$field}.tooltip")}
    </label>
    <div class="controls">
        <textarea id="elm_{$section}_{$device}_{$field}" name="banner_data[{$section}][{$device}][{$field}]" cols="35" rows="6"
        class="{$class}">{$banner_settings.$device.$field|default:"`$default`"}</textarea>
    </div>
</div>