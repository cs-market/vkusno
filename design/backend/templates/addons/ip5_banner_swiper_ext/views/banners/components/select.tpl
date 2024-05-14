<div class="control-group">
    <label 
        for="elm_{$section}_{$device}_{$field}"
        class="control-label">{__("ip5_banner.params.{$field}")}
        {include file="common/tooltip.tpl" tooltip=__("ip5_banner.params.{$field}.tooltip")}
    </label>
    <div class="controls">
        <select class="{$class}" name="banner_data[{$section}][{$device}][{$field}]" id="elm_{$section}_{$device}_{$field}">
            {foreach $variants as $e}
                <option value="{$e}" {if $banner_settings.$device.$field == $e}selected="selected" {/if}>
                    {__("ip5_banner.params.{$field}.variants.{$e}")}</option>
            {/foreach}
        </select>
    </div>
</div>