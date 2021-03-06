<?php 
	namespace Admin;
	
	class ParticipantController extends BaseAdminController{
      protected $participants;
      protected $actionForm;
      protected $titleBtnSubmit;

		public function _list() {
   		$this->setHeadTitle("Lista de Participantes");
         if (isset($this->params[":p"])) {
            $page = $this->params[":p"];
         } else {
            $page = 1;
         }
         \Participant::setCurrentPage($page);

         if (isset($this->params[":id"])){
            $this->participants = \Participant::findById($this->params[":id"]);
            $this->pagination = new \Pager(count($this->participants), \Participant::getLimitByPage(), $page);
         }
         else{
            $this->participants = \Participant::all();
            $this->pagination = new \Pager(\Participant::count(), \Participant::getLimitByPage(), $page);
         }
		}

		public function _new(){
			$this->setHeadTitle("Criar participante");
         $this->actionForm = $this->getUri("admin/participantes/novo");
         $this->participants = new \Participant();
		}

      public function create() {
         $this->participants = new \Participant($this->params["participant"]);
         if ($this->participants->save()) {
            \Logger::creationLog($_SESSION["admin"]->getName(), "Participantes", $this->participant->getIdParticipant());
            \flashMessage::successMessage("Cadastro de participante realizado com sucesso.");
            $this->redirectTo("admin/participantes/lista");
         }
         else {
            $errors = $this->participants->getErrors();
            foreach ($errors as $error) {
               \flashMessage::errorMessage($error);
            }
            $this->setHeadTitle("Criar participante");
            $this->render("_new");
         }
      }

		public function _edit(){
			$this->setHeadTitle("Modificar participante");
         $this->actionForm = $this->getUri("admin/participantes/{$this->params[":id"]}/alterar");
         $this->participants = \Participant::findById($this->params[":id"]);
		}

      public function update() {
         $this->participants = \Participant::findById($this->params[":id"]);
         if ($this->participants->update($this->params["admin"])) {
            \Logger::updateLog($_SESSION["admin"]->getName(), "Participantes", $this->participant->getIdParticipant());
            \flashMessage::successMessage("Cadastro de participante alterado com sucesso.");
            $this->redirectTo("admin/participantes/lista");
         }
         else {
            $errors = $this->participants->getErrors();
            foreach ($errors as $error) {
               \flashMessage::errorMessage($error);
            }
            $this->setHeadTitle("Modificar participante");
            $this->actionForm = $this->getUri("admin/participantes/{$this->params[":id"]}/alterar");
            $this->render("edit");
         }
      }

      public function remove() {
         if ($this->participant = \Participant::findById($this->params[":id"])) {
            if ($this->participant->remove()) {
               \Logger::deletionLog($_SESSION["admin"]->getName(), "Participantes", $this->participant->getIdParticipant());
               \flashMessage::successMessage("Participante removido com sucesso.");
               $this->redirectTo("admin/participantes/lista");
            }
            else {
               \flashMessage::errorMessage("Erro ao tentar remover o cadastro de participante.");
               $this->redirectTo("admin/participantes/lista");               
            }
         }
         else {
            \flashMessage::errorMessage("O participante que você está tentando remover não existe.");
            $this->redirectTo("admin/participantes/lista");  
         }
      }

      public function enableParticipant() {
         if ($this->participant = \Participant::findById($this->params[":id"])) {
            if ($this->participant->enable()) {
               \flashMessage::successMessage("Participante ativado com sucesso.");
               $this->redirectTo("admin/participantes/lista");
            }
            else {
               \flashMessage::errorMessage("Erro ao tentar ativar o participante.");
               $this->redirectTo("admin/participantes/lista");               
            }
         }
         else {
            \flashMessage::errorMessage("O participante que você está ativar não existe.");
            $this->redirectTo("admin/participantes/lista");  
         }
      }

      public function disableParticipant() {
         if ($this->participant = \Participant::findById($this->params[":id"])) {
            if ($this->participant->disable()) {
               \flashMessage::successMessage("Participante desativado com sucesso.");
               $this->redirectTo("admin/participantes/lista");
            }
            else {
               \flashMessage::errorMessage("Erro ao tentar desativar o participante.");
               $this->redirectTo("admin/participantes/lista");               
            }
         }
         else {
            \flashMessage::errorMessage("O participante que você está desativar não existe.");
            $this->redirectTo("admin/participantes/lista");  
         }
      }
	} 
?>