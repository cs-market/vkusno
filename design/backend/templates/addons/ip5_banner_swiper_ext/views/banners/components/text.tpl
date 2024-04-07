<div class="control-group">
    <label 
        for="elm_{$section}_{$device}_{$field}"
        class="control-label">{__("ip5_banner.params.{$field}")}
        {include file="common/tooltip.tpl" tooltip=__("ip5_banner.params.{$field}.tooltip")}
    </label>
    <div class="controls">
        <input type="text" class="{$class}" name="banner_data[{$section}][{$device}][{$field}]" id="elm_{$section}_{$device}_{$field}"
        value="{$banner_settings.$device.$field|default:"`$default`"}" size="{$size}"/>
    </div>
</div>