{** -------------------------------------------------------------------- **}
{** full_width_grid **}
{** -------------------------------------------------------------------- **}
{if !$grid.parent_id && ( $grid.width + $grid.offset >= $runtime.layout.width ) }
	<div class="control-group cm-no-hide-input">
	<label class="control-label" for="ext_grid_full_width_{$id}">{__("full_width_grid")}</label>
	<div class="controls">
		<select id="ext_grid_full_width_{$id}" name="extended">
			<option value="O" {if $grid.extended == "O"}selected="selected"{/if}>{__("original")}</option>
			<option value="E" {if $grid.extended == "E"}selected="selected"{/if}>{__("ext_section")}</option>
			<option value="F" {if $grid.extended == "F"}selected="selected"{/if}>{__("full_ext_section")}</option>
		</select>
		</div>
	</div>
{/if}