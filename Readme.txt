# FarmTech Solutions

## 📄 Descrição

Este projeto trata-se um banco de dados desenvolvido para gerenciar fazendas agrícolas que utilizam sensoriamento avançado para otimizar a aplicação de água e nutrientes. O projeto está sendo modelado e implementado utilizando **Oracle Database** através do **Oracle SQL Developer Data Modeler**. O principal objetivo do sistema é registrar dados de sensores, informações de culturas, zonas de plantio e ajustes de irrigação e fertilização, proporcionando uma visão integrada e eficiente do manejo agrícola.

## 🗃️ Estrutura e Relações do Banco de Dados

O banco de dados é composto por várias tabelas inter-relacionadas, organizadas para representar as fazendas, culturas, zonas de plantio, sensores, e os ajustes realizados no manejo. A seguir, explicaremos detalhadamente cada uma das tabelas e suas relações:

### 1. **`tbl_fazenda`**
Esta tabela armazena as informações básicas sobre as fazendas cadastradas.

- **id_fazenda**: Chave primária, identificador único da fazenda.
- **fzd_nome**: Nome da fazenda.
- **fzd_endereco**: Endereço da fazenda.

### 2. **`tbl_cultura`**
Tabela responsável por registrar os tipos de culturas plantadas em cada fazenda.

- **id_cultura**: Chave primária, identificador único da cultura.
- **ctr_nome**: Nome da cultura (ex.: Café, Soja).
- **ctr_ciclo_vida**: Ciclo de vida da cultura (em dias).
- **id_solo**: Chave estrangeira que referencia o tipo de solo na tabela `tbl_solo`.

### 3. **`tbl_solo`**
Tabela que define os diferentes tipos de solo presentes nas zonas de plantio.

- **id_solo**: Chave primária, identificador único do tipo de solo.
- **sol_tipo**: Tipo de solo (ex.: Argiloso, Arenoso, Misturado).
- **sol_composicao**: Composição química e física do solo.

### 4. **`tbl_zona_plant`**
Representa as diferentes zonas de plantio dentro de uma fazenda. Cada fazenda pode ter várias zonas de plantio, cada uma com suas características específicas.

- **id_zona**: Chave primária, identificador único da zona de plantio.
- **zona_nome**: Nome da zona de plantio.
- **id_fazenda**: Chave estrangeira que referencia a fazenda à qual a zona de plantio pertence.
- **id_cultura**: Chave estrangeira que referencia a cultura plantada na zona.
- **id_solo**: Chave estrangeira que referencia o tipo de solo presente na zona.

### 5. **`tbl_sensor`**
Armazena os dados sobre os sensores utilizados para monitoramento nas zonas de plantio.

- **id_sensor**: Chave primária, identificador único do sensor.
- **sensor_tipo**: Tipo do sensor (ex.: Umidade, Temperatura, pH).
- **sensor_ultima_leitura**: Última leitura registrada pelo sensor.
- **sensor_ultima_atualizacao**: Data e hora da última leitura.
- **id_zona**: Chave estrangeira que referencia a zona de plantio onde o sensor está instalado.

### 6. **`tbl_ajuste`**
Tabela que registra os ajustes realizados nas zonas de plantio em termos de irrigação e aplicação de nutrientes.

- **id_ajuste**: Chave primária, identificador único do ajuste.
- **ajt_data**: Data e hora em que o ajuste foi realizado.
- **ajt_qntd_n**: Quantidade de Nitrogênio aplicada (em kg ou litros).
- **ajt_qntd_p**: Quantidade de Fósforo aplicada (em kg ou litros).
- **ajt_qntd_k**: Quantidade de Potássio aplicada (em kg ou litros).
- **ajt_qntd_agua**: Quantidade de água aplicada (em litros).
- **ajt_tipo_irrigacao**: Tipo de irrigação realizada (ex.: Gotejamento, Aspersão).
- **ajt_vazao**: Vazão da irrigação (em litros por segundo).
- **ajt_duracao**: Duração da irrigação (em minutos).
- **id_zona**: Chave estrangeira que referencia a zona de plantio onde o ajuste foi realizado.

### 7. **`tbl_irrigacao`**
Tabela dedicada a armazenar os detalhes de cada evento de irrigação.

- **id_irrigacao**: Chave primária, identificador único do evento de irrigação.
- **irr_data**: Data e hora em que a irrigação ocorreu.
- **irr_tipo**: Tipo de irrigação (Gotejamento, Pivô Central, etc.).
- **irr_qntd_agua**: Quantidade de água utilizada.
- **id_zona**: Chave estrangeira que referencia a zona onde a irrigação foi realizada.

### 8. **`tbl_colheita`**
Armazena os dados das colheitas realizadas nas zonas de plantio.

- **id_colheita**: Chave primária, identificador único da colheita.
- **col_data**: Data da colheita.
- **col_qntd_colhida**: Quantidade colhida (em toneladas ou unidades).
- **id_zona**: Chave estrangeira que referencia a zona de onde a colheita foi realizada.
  
## 🔗 Relações Entre Tabelas

### Relacionamentos principais:

- **Fazenda e Zonas de Plantio**: Cada fazenda (`tbl_fazenda`) pode ter várias zonas de plantio (`tbl_zona_plant`), representando diferentes áreas dentro da fazenda que podem cultivar culturas distintas ou iguais. A relação entre elas é 1:N (uma fazenda para muitas zonas de plantio).
  
- **Zona de Plantio e Cultura**: Cada zona de plantio (`tbl_zona_plant`) é dedicada ao cultivo de uma cultura específica (`tbl_cultura`). A relação é N:1 (várias zonas podem cultivar a mesma cultura).

- **Zona de Plantio e Solo**: Cada zona de plantio está associada a um tipo de solo (`tbl_solo`), o que influencia diretamente as decisões de manejo. A relação é N:1 (várias zonas podem ter o mesmo tipo de solo).

- **Zona de Plantio e Sensores**: Cada zona de plantio pode ter vários sensores (`tbl_sensor`) instalados para monitoramento. A relação é 1:N (uma zona pode ter vários sensores).

- **Zona de Plantio e Ajustes de Irrigação/Nutrientes**: Todos os ajustes (`tbl_ajuste`) e eventos de irrigação (`tbl_irrigacao`) estão associados a uma zona de plantio específica. Cada zona de plantio pode ter vários registros de ajustes e irrigação, formando uma relação 1:N (uma zona para muitos ajustes e irrigação).

- **Zona de Plantio e Colheitas**: Cada colheita (`tbl_colheita`) é associada a uma zona de plantio, formando uma relação 1:N (uma zona para várias colheitas ao longo do tempo).

### Integridade Referencial

As chaves estrangeiras garantem que as referências entre tabelas sejam mantidas corretamente, evitando a inserção de dados inconsistentes. Por exemplo:
- A `id_fazenda` na tabela `tbl_zona_plant` assegura que todas as zonas de plantio estão ligadas a fazendas válidas.
- A `id_zona` presente em tabelas como `tbl_sensor`, `tbl_ajuste`, `tbl_irrigacao`, e `tbl_colheita` garante que os dados de sensores, ajustes e colheitas estão corretamente associados às zonas de plantio.

## 🛡️ Licença

Este projeto está licenciado sob a **MIT License**. 

## 🤝 Contribuições

Contribuições são sempre bem-vindas! Sinta-se à vontade para abrir issues ou enviar pull requests com melhorias ou correções.

## 📞 Contato

Para dúvidas ou sugestões, entre em contato através do email: rm559645@fiap.com.br.
