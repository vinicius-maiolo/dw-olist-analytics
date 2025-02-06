# Roadmap DW Olist

### **1. Definição dos** Objetivos **do Projeto**

- **1.1 Escopo:** Desenvolvimento de Data Warehouse (banco de dados analítico) no Google Cloud Platform (GCP), a partir de amostra estática de dados de e-commerce’s providos pela [Olist](https://www.kaggle.com/datasets/olistbr/brazilian-ecommerce/data), para posterior análise e geração de insights acionáveis em relação ao acompanhamento e otimização da performance das lojas.

- **1.2 Objetivos Específicos:**
    - Criação de uma camada “raw” (`raw_olist`) para carga de dados brutos.
    - Criação de uma camada "curated" (`curated_olist`) a partir dos dados brutos, com dados tipados, deduplicação de dados (se necessário) e colunas renomeadas.
    - Desenvolvimento do Data Warehouse (`dw_olist`), conjunto de tabelas que se relacionam a partir do conceito de modelagem dimensional, isto é, tabelas fato e dimensão.
    - Desenvolvimento de ao menos um dataset alimentado por tabelas fato e dimensões, ou seja, desenvolvimento de um dataset alimentado pelo dw.
    - A partir desse dataset, elaborar visualizações no Power BI para gerar insights acionáveis sobre a performance de lojas virtuais.

### **2. Planejamento do Projeto**

- **2.1 Análise de Requisitos:**
    
    2.1.1 [Identificar as fontes de dados disponíveis, compreender e documentar sua estrutura.](https://www.notion.so/Identificar-as-fontes-de-dados-dispon-veis-e-compreender-sua-estrutura-18f2330fc8a0803baa9be11234467027?pvs=21)
    
    2.1.2. [Definir os eventos (fatos) , contextos (dimensões) e análises (datasets) de negócio relevantes para os relatórios de interesse.](https://www.notion.so/Definir-os-eventos-fatos-contextos-dimens-es-e-an-lises-datasets-relevantes-para-as-an-lises-18f2330fc8a080028a8bd957508f2300?pvs=21)
    
- **2.2 Cronograma e Documentação da Execução:**
    - **Semana 1:**
        
        [Preparação do ambiente no GCP e upload dos dados brutos (camada `raw_olist`).](https://www.notion.so/Prepara-o-do-ambiente-no-GCP-e-upload-dos-dados-brutos-camada-raw-18f2330fc8a08051ac74d721aa7f3ff2?pvs=21)
        
    - **Semana 2:**
        
        [Criação da camada `curated_olist`](https://www.notion.so/Cria-o-da-camada-curated_olist-18f2330fc8a0802d9b89f3db59b40ca1?pvs=21)
        
    - **Semana 3:**
        
        [Desenvolvimento da modelagem dimensional](https://www.notion.so/Desenvolvimento-da-modelagem-dimensional-18f2330fc8a080beb430c2ad1d8eb785?pvs=21)
        
    - **Semana 4:**
        
        [Desenvolvimento de Dashboards em Power BI e Documentação da Estrutura](https://www.notion.so/Desenvolvimento-de-dashboards-no-Power-BI-18f2330fc8a08054b73eda6c403fd0f5?pvs=21)
        
        [Validação dos resultados](https://www.notion.so/Valida-o-dos-resultados-18f2330fc8a0802ba404fcdcd5e1abfa?pvs=21)
        

### **3. Apresentação do Projeto**

- **3.1 Preparação da Visualização:**
    - Desenvolvimento do relatório de performance final, contendo insights gerados a partir da Análise Exploratória dos dados modelados, além das análises extraídas dos visuais desenvolvidos.
    

- **3.2 Demonstração:**
    - Apresentar o relatório e dashboards desenvolvidos, enfatizando sua capacidade de gerar insights acionáveis.