<?php
	require_once 'lib/constantes.php';
	require_once 'lib/database.php';

	// se uma ação foi informada na URL
	if (isset($_GET['acao']))
	{
		// captura a ação informada
		$acao = $_GET['acao'];
	}

	// se não foi informada ação
	if(!$acao)
	{
		// assume ação padrão (listar)
		$acao = 'listar';
	}

	switch($acao)
	{
		case 'listar':
			break;
		case 'incluir':
			// define o título da página
			$titulo_pagina = 'Novo usuário';
			// carrega arquivo com o formulário para incluir novo usuário
			require_once 'gui/form_usuarios.php';
			// interrompe o switch...case
			break;
		case 'alterar':
			// se não informou id na URL
			if (!isset($_GET['id']))
			{
				// encerra (mata) o script com mensagem de erro
				die('Erro: O código do usuário a alterar não foi informado.');
			}

			// captura o id passado na URL
			$id = $_GET['id'];

			// monta consulta SQL para recuperar os dados do usuário a ser alterado
			$consulta = "select * from usuarios where id = $id";
			// executa a consulta
			consultar($consulta);
			// captura o registro retornado pela consulta
			$registro = proximo_registro();

			// extrai as informações em variáveis avulsas
			$nome = $registro['nome'];
			$email = $registro['email'];
			$login = $registro['login'];

			// carrega o formulário para alterar o usuário
			require_once('gui/form_usuarios.php');
			break;
		case 'gravar':
			break;
		case 'excluir':
			break;
		default:
			die('Erro: Ação inexistente!');
	}