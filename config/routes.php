<?php
    require 'main.php';
    $router = new Router($_SERVER['REQUEST_URI']);

    /*
    * rotas para acesso geral
    */ 

    //rota para raiz
   	$router->get('/', array('controller' => 'HomeController', 'action' => 'index'));
   	
   	//rotas para eventos
   	$router->get('/eventos/proximos', array('controller' => 'EventsController', 'action' => 'next'));
    $router->get('/eventos/proximos/pagina/:p', array('controller' => 'EventsController', 'action' => 'next'));

    $router->get('/eventos/anteriores', array('controller' => 'EventsController', 'action' => 'previous'));
    //$router->get('/eventos/anteriores/pagina/:p', array('controller' => 'EventsController', 'action' => 'previous'));


   	//rotas para notícias
   	$router->get('/noticias/lista', array('controller' => 'NewsController', 'action' => 'show'));
   	$router->get('/noticias/item', array('controller' => 'NewsController', 'action' => 'item'));

    //rotas para mídia
    $router->get('/midia/galeria', array('controller' => 'MediaController', 'action' => 'gallery'));

    //rotas para contato
    $router->get('/contato', array('controller' => 'ContactsController', 'action' => 'index'));

    //rotas para contato
    $router->get('/contato', array('controller' => 'ContactsController', 'action' => 'index'));

   	//rota para login/cadastro - usuários
    $router->get('/conta/login', array('controller' => 'ParticipantController', 'action' => 'login'));
    $router->post('/conta/login', array('controller' => 'ParticipantController', 'action' => 'validateLogin'));
    $router->get('/conta/sair', array('controller' => 'ParticipantController', 'action' => 'logout'));
    $router->get('/conta/nova', array('controller' => 'ParticipantController', 'action' => '_new'));
    $router->post('/conta/nova', array('controller' => 'ParticipantController', 'action' => 'create'));

    /*
    * rotas para area do admin
    */ 

    //root do admin
    $router->get('/admin', array('controller' => 'Admin\HomeController', 'action' => 'index'));

    //rota para login
    $router->get('/admin/login', array('controller' => 'Admin\LoginController', 'action' => 'index'));
    $router->post('/admin/login', array('controller' => 'Admin\LoginController', 'action' => 'login'));
    $router->get('/admin/logout', array('controller' => 'Admin\LoginController', 'action' => 'logout'));

    //rota para tipos de eventos
    $router->get('/admin/eventos/tipos', array('controller' => 'Admin\EventsTypeController', 'action' => '_list')); 
    $router->get('/admin/eventos/tipos/novo', array('controller' => 'Admin\EventsTypeController', 'action' => '_new')); 
    $router->post('/admin/eventos/tipos/novo', array('controller' => 'Admin\EventsTypeController', 'action' => 'create')); 
    $router->get('/admin/eventos/tipos/:id/alterar', array('controller' => 'Admin\EventsTypeController', 'action' => 'edit')); 
    $router->post('/admin/eventos/tipos/:id/alterar', array('controller' => 'Admin\EventsTypeController', 'action' => 'update')); 
    $router->get('/admin/eventos/tipos/:id/remover', array('controller' => 'Admin\EventsTypeController', 'action' => 'remove')); 

    //rota para eventos
    $router->get('/admin/eventos/lista', array('controller' => 'Admin\EventsController', 'action' => '_list'));
    $router->get('/admin/eventos/lista/pagina/:p', array('controller' => 'Admin\EventsController', 'action' => '_list'));
    $router->get('/admin/eventos/novo', array('controller' => 'Admin\EventsController', 'action' => '_new'));
    $router->post('/admin/eventos', array('controller' => 'Admin\EventsController', 'action' => 'create'));    
    $router->get('/admin/eventos/:id/alterar', array('controller' => 'Admin\EventsController', 'action' => 'edit'));
    $router->post('/admin/eventos/:id', array('controller' => 'Admin\EventsController', 'action' => 'update'));
    $router->get('/admin/eventos/:id/remover', array('controller' => 'Admin\EventsController', 'action' => 'remove'));

    //rota para mídia
    $router->get('/admin/midia/lista', array('controller' => 'Admin\MediaController', 'action' => '_list'));
    $router->get('/admin/midia/lista/pagina/:p', array('controller' => 'Admin\MediaController', 'action' => '_list'));


    $router->get('/admin/midia/nova', array('controller' => 'Admin\MediaController', 'action' => '_new'));
    $router->get('/admin/midia/:id/alterar', array('controller' => 'Admin\MediaController', 'action' => '_edit'));
    $router->post('/admin/midia', array('controller' => 'Admin\MediaController', 'action' => 'create'));    
    $router->post('/admin/midia/:id', array('controller' => 'Admin\MediaController', 'action' => 'update'));
    $router->get('/admin/midia/:id/remover', array('controller' => 'Admin\MediaController', 'action' => 'remove'));

    //rota para inscrições
    $router->get('/admin/inscricoes/lista', array('controller' => 'Admin\EnrollmentsController', 'action' => '_list'));
    $router->get('/admin/inscricoes/nova', array('controller' => 'Admin\EnrollmentsController', 'action' => '_new'));
    $router->get('/admin/inscricoes/:id/alterar', array('controller' => 'Admin\EnrollmentsController', 'action' => '_edit'));
    $router->get('/admin/inscricoes/presenca', array('controller' => 'Admin\EnrollmentsController', 'action' => 'attendance'));

    //rota para usuários
    $router->get('/admin/usuarios/lista', array('controller' => 'Admin\UsersController', 'action' => '_list'));
    $router->get('/admin/usuarios/novo', array('controller' => 'Admin\UsersController', 'action' => '_new'));
    $router->get('/admin/usuarios/:id/alterar', array('controller' => 'Admin\UsersController', 'action' => '_edit'));


    //rota para configuracoes
    $router->get('/admin/config/geral', array('controller' => 'Admin\SettingsController', 'action' => 'general'));
    $router->get('/admin/config/tema', array('controller' => 'Admin\SettingsController', 'action' => 'theme'));
    $router->get('/admin/config/banners', array('controller' => 'Admin\SettingsController', 'action' => 'banners'));
    //forma de pgto
    $router->get('/admin/config/pagamento', array('controller' => 'Admin\PaymentTypeController', 'action' => '_list'));
    $router->get('/admin/config/pagamento/nova', array('controller' => 'Admin\PaymentTypeController', 'action' => '_new'));
    $router->post('/admin/config/pagamento/nova', array('controller' => 'Admin\PaymentTypeController', 'action' => 'create'));
    $router->get('/admin/config/pagamento/:id/alterar', array('controller' => 'Admin\PaymentTypeController', 'action' => 'edit'));
    $router->post('/admin/config/pagamento/:id/alterar', array('controller' => 'Admin\PaymentTypeController', 'action' => 'update'));
    $router->get('/admin/config/pagamento/:id/remover', array('controller' => 'Admin\PaymentTypeController', 'action' => 'remove'));
    $router->get('/admin/config/contato', array('controller' => 'Admin\SettingsController', 'action' => 'contacts'));
    $router->load();
?>