<!-- BEGIN: main -->
<table class="tab1">
	<thead>
		<tr>
			<td width="20px">{LANG.select}</td>
			<td>{LANG.playlist_name}</td>
			<td>{LANG.singer}</td>
			<td>{LANG.user_send_lyric}</td>
			<td>{LANG.active}</td>
			<td width="100px" align="center">{LANG.feature}</td>
		</tr>
	</thead>
	<!-- BEGIN: row -->
	<tbody{class}>
		<tr>
			<td align="center"><input type='checkbox' class='filelist' value="{id}"></td>
			<td>{name}</td>
			<td>{singer}</td>
			<td>{username}</td>
			<td width="50px" align="center"><a href="{URL_ACTIVE}" class="active">{active}</a>
			</td>
			<td align="center">
				<span class="edit_icon">
					<a class='editfile' href="{URL_EDIT}">{LANG.edit}</a>
				</span>
				&nbsp;-&nbsp; 
				<span class="delete_icon">
					<a class='delfile' href="{URL_DEL_ONE}">{LANG.delete}</a>
				</span>
			</td>
		</tr>
	</tbody>
	<!-- END: row -->
</table>
<table class="tab1">
	<tfoot>
		<tr>
			<td>
				<span>
					<a href='javascript:void(0);' id='checkall'>{LANG.checkall}</a>
					&nbsp;&nbsp;
					<a href='javascript:void(0);' id='uncheckall'>{LANG.uncheckall}</a>
					&nbsp;&nbsp;
				</span>
				<span class="delete_icon"><a id='delfilelist' href="javascript:void(0);">{LANG.delete}</a>
				</span>
				<span><a id='activelist' href="javascript:void(0);">{LANG.active1}</a></span>
			</td>
		</tr>
	</tfoot>
</table>
<script type='text/javascript'>
	$(function()
	{
		$('#checkall').click(function()
		{
			$('input:checkbox').each(function()
			{
				$(this).attr('checked', 'checked');
			});
		});
		
		$('#uncheckall').click(function()
		{
			$('input:checkbox').each(function()
			{
				$(this).removeAttr('checked');
			});
		});
		
		$('#activelist').click(function()
		{
			if (confirm("{LANG.active_confirm}"))
			{
				var listall = [];
				$('input.filelist:checked').each(function()
				{
					listall.push($(this).val());
				});
				if (listall.length < 1)
				{
					alert("{LANG.error_check_playlist}");
					return false;
				}
				$.ajax(
				{
					type: 'POST',
					url: '{URL_ACTIVE_LIST}',
					data: 'listall=' + listall,
					success: function(data)
					{
						alert(data);
						window.location = '{URL_DEL_BACK}';
					}
				});
			}
		});
		$('#delfilelist').click(function()
		{
			if (confirm("{LANG.playlist_del_confirm}"))
			{
				var listall = [];
				$('input.filelist:checked').each(function()
				{
					listall.push($(this).val());
				});
				if (listall.length < 1)
				{
					alert("{LANG.error_check_playlist}");
					return false;
				}
				$.ajax(
				{
					type: 'POST',
					url: '{URL_DEL}',
					data: 'listall=' + listall,
					success: function(data)
					{
						alert(data);
						window.location = '{URL_DEL_BACK}';
					}
				});
			}
		});
		$('a[class="delfile"]').click(function(event)
		{
			event.preventDefault();
			if (confirm("{LANG.playlist_del_confirm}"))
			{
				var href = $(this).attr('href');
				$.ajax(
				{
					type: 'POST',
					url: href,
					data: '',
					success: function(data)
					{
						alert(data);
						window.location = '{URL_DEL_BACK}';
					}
				});
			}
		});
		$('a[class="active"]').click(function(event)
		{
			event.preventDefault();
			if (confirm("{LANG.active_confirm}"))
			{
				var href = $(this).attr('href');
				$.ajax(
				{
					type: 'POST',
					url: href,
					data: '',
					success: function(data)
					{
						window.location = '{URL_DEL_BACK}';
					}
				});
			}
		});
	});
</script>
<!-- END: main -->
