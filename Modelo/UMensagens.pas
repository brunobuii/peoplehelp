unit UMensagens;

interface

type
  TTipordCadastro = (tdPrestador
                    , tdUsu�rio);
resourcestring
  //Geral
  STR_ATENCAO                 = 'Aten��o';
  STR_CAPTION_ABA_CONSULTAS   = '%d - %s...';
  STR_TODOS                   = 'Todos';
  STR_ATUALIZADO              = 'atualizado(a)';
  STR_GRAVADO                 = 'gravado(a)';
  STR_EXCLUIDO                = 'excluido(a)';
  STR_OPERACAO_COM_SUCESSO    = '%s com c�digo %d %s com sucesso.';
  STR_ENTIDADE_NAO_ENCONTRADA = '%s com c�digo %d n�o foi encontrado(a)';

  //Entidade
  STR_ENTIDADE_GRAVADA_COM_SUCESSO    = '%s gravado(a) com sucesso! C�digo gerado: %d.';
  STR_ENTIDADE_ATUALIZADO_COM_SUCESSO = '%s atualizado(a) com sucesso!';
  STR_ENTIDADE_DESEJA_EXCLUIR         = 'Deseja realmente excluir este(a) %s?';

  //CRUD
  STR_CRUD_CABECALHO = 'Cadastro de %s';

  //Transa��o
  STR_JA_EXISTE_TRANSACAO_ATIVA   = 'N�o foi possivel abrir uma nova transa��o! Motivo: J� existe uma transa��o ativa.';
  STR_NAO_EXISTE_TRANSACAO_ATIVA  = 'N�o foi possivel %s a transa��o! Motivo: N�o existe uma transa��o ativa.';
  STR_VALIDA_TRANSACAO_ATIVA      = 'Opera��o abortada! Motivo: Para realizar esta opera��o � necess�rio ter uma transa��o ativa.';
  STR_ABORTAR                     = 'abortar';
  STR_FINALIZAR                   = 'finalizar';

  //Usuario
  STR_USUARIO = 'Usu�rio';
  STR_USUARIO_OU_SENHA_SAO_INVALIDOS = 'Usu�rio ou senha informados s�o inv�lidos';
  STR_SENHA_ATUAL_NAO_CONFERE        = 'Senha atual n�o confere';
  STR_USUARIO_NOME_NAO_INFORMADO     = 'Nome do usu�rio n�o foi informado';
  STR_SENHAS_NAO_CONFEREM            = 'Senhas informadas n�o conferem';

  //Cidade
  STR_CIDADE = 'Cidade';

  //Bairro
  STR_BAIRRO = 'Bairro';

  //Hor�rios
  STR_OITO_ZERO           = '08:00';
  STR_OITO_TRINTA         = '08:30';
  STR_NOVE_ZERO           = '09:00';
  STR_NOVE_TRINTA         = '09:30';
  STR_DEZ_ZERO            = '10:00';
  STR_DEZ_TRINTA          = '10:30';
  STR_ONZE_ZERO           = '11:00';
  STR_ONZE_TRINTA         = '11:30';
  STR_TREZE_ZERO          = '13:00';
  STR_TREZE_TRINTA        = '13:30';
  STR_QUATORZE_ZERO       = '14:00';
  STR_QUATORZE_TRINTA     = '14:30';
  STR_QUINZE_ZERO         = '15:00';
  STR_QUINZE_TRINTA       = '15:30';
  STR_DEZESSEIS_ZERO      = '16:00';
  STR_DEZESSEIS_TRINTA    = '16:30';
  STR_DEZESSETE_ZERO      = '17:00';
  STR_DEZESSETE_TRINTA    = '17:30';
  STR_DEZOITO_ZERO        = '18:00';
  STR_DEZOITO_TRINTA      = '18:30';
  STR_DEZENOVE_ZERO       = '19:00';
  STR_DEZENOVE_TRINTA     = '19:30';

implementation

end.
