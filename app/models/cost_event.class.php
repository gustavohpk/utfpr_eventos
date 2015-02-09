<?php
	class CostEvent extends BaseModel {	
		private $idCostEvent;
		private $idEvent;
		private $dateMax;
		private $cost;

		public function setIdCostEvent($idCostEvent) {
			$this->idCostEvent = $idCostEvent;
		}

		public function getIdCostEvent() {
			return $this->idCostEvent;
		}

		public function setIdEvent($idEvent) {
			$this->idEvent = $idEvent;
		}

		public function getIdEvent() {
			return $this->idEvent;
		}

		public function setDateMax($dateMax) {
			$this->dateMax = empty($dateMax) ? null : date("Y-m-d H:i:s", strtotime(str_replace("/", "-", $dateMax)));
		}

		public function getDateMax($format = "Y-m-d H:i:s") {
			return is_null($this->dateMax) ? null : date($format, strtotime($this->dateMax));
		}

		public function setCost($cost) {
			$this->cost = $cost;
		}

		public function getCost() {
			return $this->cost;
		}

		public function validateData() {
			$valid = false;
			if ((intval($this->getIdEvent())) < 1){
				$this->errors[] = "Não foi informado nenhum evento para o preço cadastrado.";
				if($valid == true) $valid = false;
			}
			if (is_null($this->getDateMax())){
				$this->errors[] = "Data Máxima para o preço não foi definida.";
				if($valid == true) $valid = false;
			}
			if ((floatval($this->getCost())) <= 0){
				$this->errors[] = "O preço do evento não pode ser 0.";
				if($valid == true) $valid = false;
			}
			if(strtotime($this->getDateMax()) > strtotime($this->events = \Event::findById($this->getIdEvent())[0]->getEndDateEnrollment())){
				$this->errors[] = "A data máxima de um preço não pode ser posterior à data limite de inscrição.";
				if($valid == true) $valid = false;
			}
			
			return $valid;
		}

 		public static function find($params = array(), $values = array(), $operator = "=", $compare = "AND"){
			list($paramsName, $paramsValue) = self::getParamsSQL($params, $values, $operator, $compare);

			$sql = 
			"SELECT 
				*
			FROM
				cost_event" . ($paramsName ? " WHERE " . $paramsName : "");
			$pdo = \Database::getConnection();
			$statment = $pdo->prepare($sql);
			$statment->execute($paramsValue);
			$rows = $statment->fetchAll($pdo::FETCH_ASSOC);
			$costEvents = array();		

			foreach ($rows as $row) {
				$costEvents[] = new CostEvent($row);
			}
			
			return $costEvents;
		}

		public static function all(){
			return self::find();
		}

		public static function findById($id){
			return self::find(array("id_cost_event"), array($id));
		}

		public static function findByIdEvent($idEvent) {
			return self::find(array("id_event"), array($idEvent));
		}

		public function getCostOfDay($date = null) {
			$date = is_null($date) ? date("Y-m-d") : $date;
			$sql = 
			"SELECT 
				MIN(date_max), cost
			FROM
				cost_event
			WHERE
				date_max >= :date AND id_event = :id_event";
			$pdo = \Database::getConnection();
			$statment = $pdo->prepare($sql);
			$statment->execute(array(":date" => $date, ":id_event" => $this->getIdEvent()));
			$row = $statment->fetch($pdo::FETCH_ASSOC);
			return (float) $row["cost"];
		}

		public function save(){
			if (!$this->isValidData()) return false;

			$sql = 
			"INSERT INTO cost_event
				(id_event, date_max, cost)
			VALUES
				(:id_event, :data_max, :cost)";
			$params = array(
					":id_event" => $this->getIdEvent(),
					":data_max" => $this->getDateMax(),
					":cost" => $this->getCost()
				);
			$pdo = \Database::getConnection();
			$statment = $pdo->prepare($sql);
			$statment = $statment->execute($params);
			$this->setIdCostEvent($pdo->lastInsertId());
			return $statment ? $this : false;
		}

		public function update($data){
			$this->setData($data);
			if (!$this->isValidData()) return false;

			$sql = 
			"UPDATE 
				cost_event
			SET
				date_max = :data_max,
				cost = :cost
			WHERE
				id_cost_event = :id_cost_event";
			$params = array(
					":data_max" => $this->getDateMax(),
					":cost" => $this->getCost(),
					":id_cost_event" => $this->getIdCostEvent()
				);
			$pdo = \Database::getConnection();
			$statment = $pdo->prepare($sql);
			$statment = $statment->execute($params);
			return $statment ? $this : false;
		}
	}
?>