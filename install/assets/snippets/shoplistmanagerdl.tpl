//<?php
/**
 * ShopList.Manager.Dl
 *
 * ShopList.Manager.Dl
 *
 * @category	snippet
 * @internal	@modx_category ShopList
 * @internal	@installset base
 * @internal	@overwrite true
 * @internal	@properties {}
 */

$info = array();	
if ($data['short_txt']) $info = unserialize($data['short_txt']);	
$data = array_merge($data,$info);	
$d = explode(' ',$data['postdate']);
$d1	= explode('-',$d[0]);
$data['date'] = $d1[2].'.'.$d1[1].'.'.$d1[0].' '.$d[1];
$orderList = unserialize($data['content']);
$data['table']='';
if (is_array($orderList))
{
	foreach($orderList as $k => $ord)
	{
		$sql = $modx->db->query('SELECT `name`,`value` FROM 
		'.$modx->getFullTableName('site_tmplvar_contentvalues').' left JOIN '.$modx->getFullTableName('site_tmplvars').'
		on '.$modx->getFullTableName('site_tmplvars').'.`id` = '.$modx->getFullTableName('site_tmplvar_contentvalues').'.`tmplvarid` 
		WHERE `contentid`='.$ord[0]);
		$doc = $modx->db->query('Select * from '.$modx->getFullTableName('site_content').' where id='.$ord[0]);
		$vals = $modx->db->getRow($doc);
		while ($row = $modx->db->getRow($sql)) $vals['tv.'.$row['name']] = $row['value'];
		if ((isset($ord['tv'])) && (count($ord['tv'])))
		{
			foreach ($ord['tv'] as $key => $val) $vals['tvadd.'.$key] = $val;
		}		
		$vals['count'] = $ord[1];
		$vals['price'] = $ord[2];
		$data['table'].=$modx->parseChunk('shop.list.row.manager', $vals, '[+', '+]' ); 
	}
}

return $data;
