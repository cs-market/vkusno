<div class="control-group">
    <label 
        for="elm_{$section}_{$device}_{$field}"
        class="control-label">{__("ip5_banner.params.{$field}")}
        {include file="common/tooltip.tpl" tooltip=__("ip5_banner.params.{$field}.tooltip")}
    </label>
    <div class="controls">

        {assign var="image_pair_name" value="`$banner_type`_`$device`_`$field`"}
        {assign var="banner_image_id" value=$banner.$image_pair_name.object_id|default:0}

        {include file="common/attach_images.tpl"
            image_name="`$banner_type`_`$device`_`$field`"
            image_object_type="ip5_banners" 
            image_pair=$banner.$image_pair_name
            image_object_id=$banner_image_id 
            no_detailed=true 
            hide_titles=true
        }
    </div>
</div>