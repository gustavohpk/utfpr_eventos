<?php
	function createUriFor($path){
		return SITE_ROOT . $path;
	}

	/*
	Funcão para auxiliar criação de links 
	Se path iniciar com / considera link absoluto, sençao considera link relativo
	*/
	function createLinkTo($path, $name, $options = ''){
		if (substr($path, 0, 1) == '/'){
			$link = SITE_ROOT.$path;
		}
		else{
			$link = $path;
		}
		return "<a href='{$link}' {$options}>$name</a>";
	}

	function createImageTag($path, $name, $options = ''){
		$path = RESOURCES_FOLDER."$path/$name";
		return "<img src='{$path}' {$options} />";
	}

	function createStylesheetTag(){
		$params = func_get_args();

		foreach ($params as $param) {
			$path = RESOURCES_FOLDER."/$param";
			echo "<link href='$path' rel='stylesheet' type='text/css' />";
		}
	}

	function createJavascriptTag(){
		$params = func_get_args();

		foreach ($params as $param) {
			$path = RESOURCES_FOLDER."/$param";
			echo "<script src='$path' type='text/javascript' charset='ISO-8859-1'></script>";
			// echo "<script src='$path' type='text/javascript'></script>";
		}
	}

	function createShortCutIcon($path){
		$path = RESOURCES_FOLDER."/img/$path";
		echo "<link href='$path' rel='shortcut icon' />";
	}

    function snakToCamelCase($value) {
      return preg_replace('/_/', '', $value);
    }

    function stylizeFlashMessages($messages){
    	$stylizedMessages = array();
    	foreach ($messages as $i => $message) {
    		$content = $message['content'];
    		$type = $message['type'];
    		$stylizedMessage = "<div class='alert alert-$type alert-dismissible' role='alert'>";
    		$stylizedMessage .= "<button type='button' class='close' data-dismiss='alert'><span aria-hidden='true'>&times;</span><span class='sr-only'>Fechar</span></button>";
    		$stylizedMessage .= "$content";
    		$stylizedMessage .= "</div>";
    		$stylizedMessages[$i] = $stylizedMessage;
    	}
    	return $stylizedMessages;
    }

    function getThumbnail($link){
    	// $code = substr($link, (strpos($link, '=')+1), 30);
    	// $thumbnailUrl = 'http://img.youtube.com/vi/' . $code . '/0.jpg';
    	// return $thumbnailUrl;
    	return Media::getThumbnail($link);
    }
?>