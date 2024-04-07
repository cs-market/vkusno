<div class="control-group">
    <label 
        for="elm_{$section}_{$device}_{$field}"
        class="control-label">{__("ip5_banner.params.{$field}")}
        {include file="common/tooltip.tpl" tooltip=__("ip5_banner.params.{$field}.tooltip")}
    </label>
    <div class="controls">

        <input type="hidden" name="banner_data[{$section}][{$device}][{$field}]" value="N" />
        <input type="checkbox" name="banner_data[{$section}][{$device}][{$field}]" id="elm_{$section}_{$device}_{$field}" value="Y"{if $banner.$section.$device.$field == "Y"} checked="checked"{/if} style="margin: 5px 5px 10px 0;" />

    </div>
</div>