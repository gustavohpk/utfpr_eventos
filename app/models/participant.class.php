<?php 
	class Participant extends BaseModel{
		private $idParticipant;
		private $name;
		private $cpf;
		private $rg;
		private $gender;
		private $birthday;
		private $idCity;
		private $city;
		private $idState;
		private $state;
		private $address;
		private $number;
		private $district;
		private $zipcode;
		private $complement;
		private $phone;
		private $phone2;
		private $email;
		private $password;

		private $code;
		private $enabled;
		private $idParticipantType;

   		public function setIdParticipant($idParticipant){
   			$this->idParticipant = $idParticipant;
   		}

   		public function setName($name){
   			$this->name = $name;
   		}

   		public function setCpf($cpf){
   			$cpf = str_replace(".", "", $cpf);
   			$cpf = str_replace("-", "", $cpf);
   			$this->cpf = $cpf;
   		}

   		public function setRg($rg){
   			$this->rg = $rg;
   		}

   		public function setGender($gender){
   			$this->gender = $gender;
   		}

   		public function setBirthday($birthday){
   			$this->birthday = empty($birthday) ? null : date("Y-m-d", strtotime(str_replace("/", "-", $birthday)));
   		}

   		public function setIdCity($idCity){
   			$this->idCity = $idCity;
   		}

   		public function setCity($city){
   			$this->city = $city;
   		}

   		public function setIdState($idState){
   			$this->idState = $idState;
   		}

   		public function setState($state){
   			$this->state = $state;
   		}

   		public function setAddress($address){
   			$this->address = $address;
   		}

   		public function setNumber($number){
   			$this->number = $number;
   		}

   		public function setDistrict($district){
   			$this->district = $district;
   		}

   		public function setZipcode($zipcode){
   			$zipcode = str_replace(".", "", $zipcode);
   			$zipcode = str_replace("-", "", $zipcode);
   			$this->zipcode = $zipcode;
   		}

   		public function setComplement($complement){
   			$this->complement = $complement;
   		}

   		public function setPhone($phone){
   			$phone = str_replace("(", "", $phone);
   			$phone = str_replace(")", "", $phone);
   			$phone = str_replace("-", "", $phone);
   			$phone = str_replace(" ", "", $phone);
   			$this->phone = $phone;
   		}

   		public function setPhone2($phone2){
   			$phone2 = str_replace("(", "", $phone2);
   			$phone2 = str_replace(")", "", $phone2);
   			$phone2 = str_replace("-", "", $phone2);
   			$phone2 = str_replace(" ", "", $phone2);
   			$this->phone2 = $phone2;
   		}

   		public function setEmail($email){
   			$this->email = $email;
   		}

   		public function setPassword($password){
   			$password = trim($password);
   			$this->password = $password;
   		}

   		public function setCode($code){
   			$this->code = $code;
   		}

   		public function setEnabled($enabled){
   			$this->enabled = $enabled;
   		}

   		public function setIdParticipantType($idParticipantType){
   			$this->idParticipantType = $idParticipantType;
   			$this->participantType = ParticipantType::findById($idParticipantType)[0];
   		}


   		public function getIdParticipant(){
   			return $this->idParticipant;
   		}

   		public function getName(){
   			return $this->name;
   		}

   		public function getCpf(){
   			return $this->cpf;
   		}

   		public function getRg(){
   			return $this->rg;
   		}

   		public function getGender(){
   			return $this->gender;
   		}

   		public function getBirthday($format = "Y-m-d"){
   			return is_null($this->birthday) ? null : date($format, strtotime($this->birthday));
   		}

   		public function getIdCity(){
   			return $this->idCity;
   		}

   		public function getCity(){
   			return $this->city;
   		}

   		public function getIdState($idState){
   			return $this->idState;
   		}

   		public function getState(){
   			return $this->state;
   		}

   		public function getAddress(){
   			return $this->address;
   		}

   		public function getNumber(){
   			return $this->number;
   		}

   		public function getDistrict(){
   			return $this->district;
   		}

   		public function getZipcode(){
   			return $this->zipcode;
   		}

   		public function getComplement(){
   			return $this->complement;
   		}

   		public function getPhone(){
   			return $this->phone;
   		}

   		public function getPhone2(){
   			return $this->phone2;
   		}

   		public function getEmail(){
   			return $this->email;
   		}

   		public function getPassword(){
   			return $this->password;
   		}

   		public function getCode(){
   			return $this->code;
   		}

   		public function getEnabled(){
   			return $this->enabled;
   		}

   		public function getIdParticipantType(){
   			return $this->idParticipantType;
   		}

   		public function validateData(){
   			if (strlen($this->getName()) < 4) $this->errors[] = "O nome deve ter no mínimo 4 caracteres.";
   			if ($this->getGender() != "M" && $this->getGender() != "F") $this->errors[] = "Sexo não informado corretamente.";
			if (!$this->validateEmail($this->getEmail())) $this->errors[] = "Email inválido.";
			if ($email = self::findByEmail($this->getEmail())) {
				$email = $email[0];
				if ($email->getIdParticipant() != $this->getIdParticipant())
					$this->errors[] = "O email informado já está sendo usado por outro participante";	
			} 
   			if (!$this->validateCpf($this->getCpf())) $this->errors[] = "CPF inválido";   			
   			if ($cpf = self::findByCpf($this->getCpf())) {
   				$cpf = $cpf[0];
   				if ($cpf->getIdParticipant() != $this->getIdParticipant())
   					$this->errors[] = "O CPF informado já esta sendo usado por outro participante.";	
   			} 
   			if ((int) $this->getIdCity() < 1) $this->errors[] = "O nome da cidade é um campo obrigatório.";

   			if($this->getIdParticipantType()){
   				if($this->participantType){
   					if($this->participantType->getCode() == "student"){
   						if(strlen($this->getCode()) != 7){
   							$this->errors[] = "O RA não foi informado corretamente.";	
   						}
   					}elseif($this->participantType->getCode() == "employee"){
   						if(strlen($this->getCode()) < 1){
   							$this->errors[] = "O código do servidor não foi informado corretamente.";	
   						}
   					}
   				}
   			}
  			
   		}

   		public function validatePassword(){
   			if (is_null($this->getPassword())){
   				$this->errors[] = "Nenhuma senha foi informada.";
   			}else{
   				return true;
   			}
   		}

		public static function find($params = array(), $values = array(), $operator = "=", $compare = "AND", $order = "id_participant", $direction ="DESC"){
			list($paramsName, $paramsValue) = self::getParamsSQL($params, $values, $operator, $compare);	
			$limit = self::getLimitByPage();
			$page = self::getCurrentPage();
			$start = ($page * $limit) - $limit;

			$sql = 
			"SELECT 
				participant.*, city.name AS city, city.id_state, state.state as state
			FROM
				participant
			INNER JOIN
				city ON city.id_city = participant.id_city
			INNER JOIN
				state ON state.id_state = city.id_state" . 
				($paramsName ? " WHERE " . $paramsName : "") . " ORDER BY " . $order . " " . $direction;
			$sql .= " LIMIT $start, $limit";;
			$pdo = \Database::getConnection();
			$statment = $pdo->prepare($sql);
			$statment->execute($paramsValue);
			$rows = $statment->fetchAll($pdo::FETCH_ASSOC);
			$participants = array();			
			foreach ($rows as $row) {
				$participants[] = new Participant($row);
			}
			return $participants;
		}

		public static function all(){
			return self::find();
		}

		public static function findById($id){
			return self::find(array("id_participant"), array($id))[0];
		}

		public static function findByCpf($cpf){
			return self::find(array("cpf"), array($cpf));
		}

		public static function findByEmail($email){
			return self::find(array("email"), array($email));
		}

		public function save(){
			if (!$this->isValidData()) return false;
			if (!$this->validatePassword()) return false;

			$sql = 
			"INSERT INTO participant
				(name, cpf, rg, gender, birthday, id_city, address, number, district, zipcode, 
				complement, phone, phone2, email, password, code, enabled, id_participant_type)
			VALUES
				(:name, :cpf, :rg, :gender, :birthday, :id_city, :address, :number, :district, :zipcode, 
				:complement, :phone, :phone2, :email, :password, :code, :enabled, :id_participant_type)";
			$params = array(
					":name" => $this->getName(),
					":cpf" => $this->getCpf(),
					":rg" => $this->getRg(),
					":gender" => $this->getGender(),
					":birthday" => $this->getBirthday(),
					":id_city" => $this->getIdCity(),
					":address" => $this->getAddress(),
					":number" => $this->getNumber(),
					":district" => $this->getDistrict(),
					":zipcode" => $this->getZipcode(),
					":complement" => $this->getComplement(),
					":phone" => $this->getPhone(),
					":phone2" => $this->getPhone2(),
					":email" => $this->getEmail(),
					":password" => md5($this->getPassword()),
					":code" => $this->getCode(),
					":enabled" => 0,
					":id_participant_type" => $this->getIdParticipantType()
				);
			$pdo = \Database::getConnection();
			$statment = $pdo->prepare($sql);
			return $statment->execute($params);
		}

		public function update($data = array()){
			$this->setData($data);
			if (!$this->isValidData()) return false;

			$sql = 
			"UPDATE
				participant
			SET
				name = :name, 
				cpf = :cpf, 
				rg = :rg, 
				gender = :gender, 
				birthday = :birthday, 
				id_city = :id_city, 
				address = :address, 
				number = :number, 
				district = :district, 
				zipcode = :zipcode, 
				complement = :complement, 
				phone = :phone, 
				phone2 = :phone2, 
				email = :email
			WHERE
				id_participant = :id_participant";
			$params = array(
					":name" => $this->getName(),
					":cpf" => $this->getCpf(),
					":rg" => $this->getRg(),
					":gender" => $this->getGender(),
					":birthday" => $this->getBirthday(),
					":id_city" => $this->getIdCity(),
					":address" => $this->getAddress(),
					":number" => $this->getNumber(),
					":district" => $this->getDistrict(),
					":zipcode" => $this->getZipcode(),
					":complement" => $this->getComplement(),
					":phone" => $this->getPhone(),
					":phone2" => $this->getPhone2(),
					":email" => $this->getEmail(),
					":id_participant" => $this->getIdParticipant()
				);
			$pdo = \Database::getConnection();
			$statment = $pdo->prepare($sql);
			$statment = $statment->execute($params);	
			return $statment ? $this : false;
		}

		public function updatePassword($data = array()){

			$participant = self::findById($data[":id"]);

			if (!$participant) return false;

			if (md5($data["old-password"]) != $participant->getPassword()) return false;

			if($data["new-password"] != $data["new-password-repeat"]) return false;

			$sql = 
			"UPDATE
				participant
			SET
				password = :password
			WHERE
				id_participant = :id_participant";
			$params = array(
					":password" => md5($data["new-password"]),
					":id_participant" => $participant->getIdParticipant()
				);
			$pdo = \Database::getConnection();
			$statment = $pdo->prepare($sql);
			$statment = $statment->execute($params);	
			return $statment ? $this : false;
		}

		public function remove(){
			$sql = "DELETE FROM participant WHERE id_participant = :id_participant";
			$pdo = \Database::getConnection();
			$statment = $pdo->prepare($sql);
			$params = array(":id_participant" => $this->getIdParticipant());
			return $statment->execute($params);
		}

		public function login($email, $password){
			$participant = self::find(array("email", "password"), array($email,md5($password)));

			if (count($participant) == 0){
				$this->errors = array("Email ou senha incorretos!");
				return false;
			}else{
				if($participant[0]->getEnabled()){
					$_SESSION["participant"] = $participant[0];
					return true;
				}else{
					FlashMessage::warningMessage("Sua conta está bloqueada ou foi recém-criada e aguarda aprovação de um administrador.");
					return false;
				}
			}
			
			//$participant = self::find(array("password"), array(md5($password)));

			
		}

		public static function logout(){
			unset($_SESSION["participant"]);
		}

		public static function count(){
			$sql = "SELECT count(id_news) as count FROM news";
			$pdo = \Database::getConnection();
			$rs = $pdo->prepare($sql);
			$rs->execute();
			$rows = $rs->fetch();
			return $rows["count"];
		}

		/**
	     * Ativa a conta do participante
	     * @return boolean Resultado
	     */
		public function enable(){
			$sql = "UPDATE participant SET enabled = :enabled WHERE id_participant = :id_participant";
			$pdo = \Database::getConnection();
			$statment = $pdo->prepare($sql);
			return $statment->execute(array(":enabled"=> 1, ":id_participant"=> $this->getIdParticipant()));
		}

		/**
	     * Desativa a conta do participante
	     * @return boolean Resultado
	     */
		public function disable(){
			$sql = "UPDATE participant SET enabled = :enabled WHERE id_participant = :id_participant";
			$pdo = \Database::getConnection();
			$statment = $pdo->prepare($sql);
			return $statment->execute(array(":enabled"=> 0, ":id_participant"=> $this->getIdParticipant()));
		}
	}
?>