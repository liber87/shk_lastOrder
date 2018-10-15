//<?php
/**
 * ShopList
 *
 * ShopList
 *
 * @category	snippet
 * @internal	@modx_category ShopList
 * @internal	@installset base
 * @internal	@overwrite true
 * @internal	@properties {}
 */

if ($_POST['status'])	
{
	$modx->db->update(array('status'=>$_POST['status']),$modx->getFullTableName('manager_shopkeeper'),'id='.$_POST['ids']);
	$modx->invokeEvent('OnSHKChangeStatus',array('order_id'=>$_POST['ids'],'status'=>$_POST['status']));
}
$params = array(
'controller'=>'onetable',
'showParent'=>'0',
'idType'=>'documents',
'ignoreEmpty'=>1,
'display'=>'5',
'paginate'=>1,
'addWhereList'=>'status=1',
'table' => 'manager_shopkeeper',
'tpl' => 'shop.list.manager',
'prepare' => 'ShopList.Manager.Dl',
'TplNextP'=>'@CODE: <li><a href="index.php?a=2&page=[+num+]"><i class="fa fa-angle-right"></i></a></li>',
'TplPrevP'=>'@CODE: <li><a href="index.php?a=2&page=[+num+]"><i class="fa fa-angle-left"></i></a></li>',
'TplPage'=>'@CODE: <li><a href="index.php?a=2&page=[+num+]">[+num+]</a></li>',
'TplCurrentPage'=>'@CODE: <li class="active"><a href="index.php?a=2&page=[+num+]">[+num+]</a></li>',
'TplWrapPaginate'=>'@CODE: <ul class="pagination">[+wrap+]</ul>',
'noneTPL'=>'@CODE: <p>Активынх заказов нет</p>');

echo '
<script>
$(document).ready(function(){
	$(".statuss").change(function(){
		$(this).next().slideDown();
	});
});
</script>
<style>
.save{display:none;}
.review_block{border-radius:0.25rem; border: 1px solid #e3e3e3;     padding: 14px 20px 24px 20px; margin-bottom:20px; position:relative; }
.status{position:absolute; top:-15px; right:15px; width:150px;}
h4{text-decoration: underline;}
</style>';
echo $modx->runSnippet('DocLister',$params).'<div class="pagination" id="pagination">[+pages+]</div>';
