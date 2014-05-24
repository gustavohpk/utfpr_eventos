<div class="col-xs-12 col-sm-12 col-md-10 col-md-offset-1 col-lg-10 col-lg-offset-1 media-list" style="display:none">
	<div class="panel panel-default">
		<div class="panel-heading">
	    <h3 class="panel-title">Lista de fotos e vídeos cadastrados</h3>
	  </div>
	  <div class="panel-body">
	  	<span class="glyphicon glyphicon-question-sign" style="float:right;"></span>
			<div class="row">
				<div class="col-xs-12 general-actions">
					<button class="btn btn-success btn-sm" title="Cadastrar" style="float: left"><span class="glyphicon glyphicon-plus-sign"></span></button>
					<div class="col-lg-4">
					  <div class="input-group">
					    <input type="text" class="form-control">
					    <div class="input-group-btn">
					      <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" title="Procurar"><span class="glyphicon glyphicon-search"></span> <span class="caret"></span></button>
					      <ul class="dropdown-menu pull-right">
				          <li><a href="#">ID</a></li>
				          <li><a href="#">Nome</a></li>
				          <li><a href="#">Tipo</a></li>
				        </ul>
					    </div>
					  </div>
					</div>
				</div>
			</div>
		</div>
		<table class="table">
			<tr>
				<td>ID</td>
				<th>Nome</th>
				<th>Tipo</th>
				<th>Ações</th>
			</tr>
			<tr>
				<td>1</td>
				<td>Foto 1</td>
				<td><span class="glyphicon glyphicon-camera" title="Foto"></span></td>
				<td>
					<button class="btn btn-primary btn-sm" title="Editar"><span class="glyphicon glyphicon-edit"></span></button>
					<button class="btn btn-danger btn-sm" title="Excluir"><span class="glyphicon glyphicon-remove-circle"></span></button>
				</td>
			</tr>
			<tr>
				<td>2</td>
				<td>Vídeo 1</td>
				<td><span class="glyphicon glyphicon-facetime-video" title="Vídeo"></span></td>
				<td>
					<button class="btn btn-primary btn-sm" title="Editar"><span class="glyphicon glyphicon-edit"></span></button>
					<button class="btn btn-danger btn-sm" title="Excluir"><span class="glyphicon glyphicon-remove-circle"></span></button>
				</td>
			</tr>
		</table>
		<div class="panel-footer">
			<div class="row">
				<div class="col-xs-12 col-sm-8 col-sm-offset-2 col-md-6 col-md-offset-3 col-lg-6 col-lg-offset-3">
					<select class="form-control">
						<option selected>Exibir no máximo 10 itens por página</option>
						<option>Exibir no máximo 20 itens por página</option>
						<option>Exibir no máximo 40 itens por página</option>
					</select>
				</div>
			</div>
			<div class="row">
				<div class="col-xs-12">
					<ul class="pagination">
					  <li class="disabled"><a href="#">&laquo;</a></li>
					  <li class="active"><a href="#">1 <span class="sr-only">Atual</span></a></li>
					  <li class=""><a href="#">2</a></li>
					  <li class=""><a href="#">3</a></li>
					  <li class=""><a href="#">&raquo;</a></li>
					</ul>
				</div>
			</div>
		</div>
	</div>
</div>