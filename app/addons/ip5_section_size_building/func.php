<?php

use Tygh\Registry;

if (!defined('BOOTSTRAP')) { die('Access denied'); }


function fn_ip5_section_size_building_install (){
	$objects = array(
		array( "t" => "?:bm_grids",
			"i" => array(
				array("n" => "extended", "p" => "char(1) NOT NULL DEFAULT '0'",),
			),
		),
	);

	if (!empty($objects) and is_array($objects)){
		foreach ($objects as $o){
		$fields = db_get_fields('DESCRIBE ' . $o['t']);
			if (!empty($fields) and is_array($fields)){

				if (!empty($o['i']) and is_array($o['i'])){

					foreach ($o['i'] as $f) {
						if (!in_array($f['n'], $fields)){

							db_query("ALTER TABLE ?p ADD ?p ?p", $o['t'], $f['n'], $f['p']);
							if (!empty($f['add_sql']) and is_array($f['add_sql'])){
								foreach ($f['add_sql'] as $sql) db_query($sql);
							}

						}
					}

				}

				if (!empty($o['indexes']) and is_array($o['indexes'])){
					foreach ($f['indexes'] as $index => $keys){
					$existing_indexes = db_get_array("SHOW INDEX FROM " . $o['t'] . " WHERE key_name = ?s", $index);
						if (empty($existing_indexes) and !empty($keys)){
							db_query("ALTER TABLE ?p ADD INDEX ?p (?p)", $o['t'], $index, $keys);
						}
					}
				}
				
			}
		}
	}

}