<?php 
	namespace Admin;
	
	class AdministratorController extends BaseAdminController{
      protected $administrators;
      protected $actionForm;

		public function _list() {
   		$this->setHeadTitle("Lista de Usuários");
         if (isset($this->params[":p"])) {
            $page = $this->params[":p"];
         } else {
            $page = 1;
         }
         $this->administrators = Administrator::all();
         $this->pagination = new \Pager(Administrator::count(), Administrator::getLimitByPage(), $page);
		}

		public function _new(){
			$this->setHeadTitle("Criar usuário");
         $this->actionForm = $this->getUri("admin/usuarios/novo");
         $this->administrators = new Administrator();
         $this->administratorLevels = \AdministratorLevel::find();
		}

      public function create() {
         $this->administrators = new Administrator($this->params["admin"]);
         if ($this->administrators->save()) {
            \flashMessage::successMessage("Cadastro de usuário realizado com sucesso.");
            $this->redirectTo("admin/usuarios/lista");
         }
         else {
            $errors = $this->administrators->getErrors();
            foreach ($errors as $error) {
               \flashMessage::errorMessage($error);
            }
            $this->setHeadTitle("Criar usuário");
            $this->render("_new");
         }
      }

		public function _edit(){
			$this->setHeadTitle("Modificar usuário");
         $this->actionForm = $this->getUri("admin/usuarios/{$this->params[":id"]}/alterar");
         if ($this->administrators = Administrator::findById($this->params[":id"])) {
            $this->administrators = $this->administrators[0];
            $this->administratorLevels = AdministratorLevel::find();
         }
		}

      public function update() {
         $this->administrators = Administrator::findById($this->params[":id"])[0];
         if ($this->administrators->update($this->params["admin"])) {
            \flashMessage::successMessage("Cadastro de usuário alterado com sucesso.");
            $this->redirectTo("admin/usuarios/lista");
         }
         else {
            $errors = $this->administrators->getErrors();
            foreach ($errors as $error) {
               \flashMessage::errorMessage($error);
            }
            $this->setHeadTitle("Modificar usuário");
            $this->actionForm = $this->getUri("admin/usuarios/{$this->params[":id"]}/alterar");
            $this->render("edit");
         }
      }

      public function remove() {
         if ($this->administrators = Administrator::findById($this->params[":id"])) {
            if($this->administrators[0]->getIdAdministrator() == $_SESSION["admin"]->getIdAdministrator()){
               \flashMessage::errorMessage("Você não pode excluir sua própria conta de usuário.");
               $this->redirectTo("admin/usuarios/lista");
            }
            if ($this->administrators[0]->remove()) {
               \flashMessage::successMessage("Usuário removido com sucesso.");
               $this->redirectTo("admin/usuarios/lista");
            }
            else {
               \flashMessage::errorMessage("Erro ao tentar remover o cadastro de usuário.");
               $this->redirectTo("admin/usuarios/lista");               
            }
         }
         else {
            \flashMessage::errorMessage("O usuário que você está tentando remover não existe.");
            $this->redirectTo("admin/usuarios/lista");
         }
      }
	} 
?>