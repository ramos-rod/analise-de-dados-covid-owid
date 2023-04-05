*English below

OBS: O dataset completo (45+ MB) excede os 25MB de limite para upload em repositórios do GitHub. Ele pode ser visto e baixado em:
https://ourworldindata.org/coronavirus
As queries SQL disponíveis nesse repositório são relativas ao mesmo dataset, porém em um momento anterior em que o projeto havia sido executado mais cruamente no Tableau. Nesta versão do projeto, a importação do dataset diretamente para o PowerBI resultou em um tempo de carregamento "não-instantâneo" durante a manipulação e filtragem inicial de algumas colunas no Power Query, mas não de forma relevante. Embora o mais eficiente seja filtrar as tabelas .xlsx ou .csv com queries SQLs específicas para selecionar estrategicamente os dados de acordo com o propósito da análise, o dataset do Our World in Data já conta com algumas estatísticas calculada muito úteis para o projeto.

# Análise de Dados COVID-19

Este projeto faz parte do portfólio de Analista de Dados e tem como objetivo demonstrar habilidades relevantes para potenciais empregadores. O projeto tem foco na exploração de extensos dados da COVID-19 para obter insights sobre os fatores que influenciaram as taxas de infecção e mortalidade da COVID-19. Esses fatores incluem condições políticas, geográficas e socioeconômicas, recursos e riqueza, rapidez e firmeza na adesão às medidas recomendadas de saúde e o momento da vacinação.

O projeto utilizou o dataset público dos relatórios da COVID-19 do Our World in Data. Um ponto de interesse inicial é que, neste conjunto de dados, a América do Norte abrange toda a América do Norte e Central, o que reduz o cálculo médio do PIB per capita.

As observações mostram que, embora uma parcela maior de idosos (65 anos ou mais) ou uma porcentagem maior de fumantes na população possa afetar a taxa de infecção e a gravidade da doença, não é o que mais mata. Em comparação, há uma relação visível entre um menor PIB per capita médio e uma taxa de mortalidade média mais alta.

A visualização 1 mostra que, ao trocar as novas mortes médias por novas mortes médias por milhão, o Brasil atingiu o pico mais alto entre os países escolhidos para a visualização. A linha quase plana da Nigéria na visualização 1 e o tamanho pequeno das bolhas nas visualizações 1 e 2 da página 2 são imprecisos devido às condições socioeconômicas e à provável subnotificação de casos e mortes.

Enquanto isso, a Oceania tem uma taxa média de infecção relativamente alta e uma taxa média de mortalidade muito baixa. Isso se deve provavelmente ao fato de que é um complexo de ilhas com uma menor entrada de turistas e imigrantes, além da resposta rápida da Austrália e da Nova Zelândia ao surto e da firmeza na aplicação das medidas de saúde.

A visualização 4 mostra que, em julho de 2021, a Europa teve, em média, uma população vacinada significativamente maior em comparação com a Ásia, América do Sul e especialmente a África. Isso aumentou ainda mais a diferença nas taxas de mortalidade, já que países pobres com pouco acesso a recursos importantes sofreram muito com as ondas sucessivas da COVID-19, incluindo a variante Delta na época da referência.

Em conclusão, este projeto demonstra o uso do PowerBI na análise dos dados da COVID-19 para obter insights sobre vários fatores que impactam as taxas de infecção e mortalidade da COVID-19. Esses insights são úteis para entender o impacto de fatores socioeconômicos, entre outros, e podem ser usados para formular políticas eficazes para mitigar seus efeitos.

-------------------------------------------------

OBS: The complete dataset (45+ MB) exceeds the 25MB upload limit for GitHub repository files. It can be viewed and downloaded at:
https://ourworldindata.org/coronavirus
The available SQL queries available in this repository are relative to the same dataset, but used in an earlier version of the project that had been executed in Tableau. In this version, importing the dataset directly to PowerBI resulted in "non-instant" loading times when cleaning and selecting data in Power Query, but not in a relevant way. Although it is most efficient to filter the .xlsx or .csv tables with specific SQL queries in order to strategically select data according to the analysis' purpose, the Our World in Data dataset comes with some calculated statistics that are very useful to the project.

# COVID-19 Data Analysis
This project is part of a Data Analyst portfolio that aims to showcase relevant skills for potential employers. The project focuses on exploring extensive COVID-19 data to gain insights on the weight some factors had on the infection and mortality rates of COVID-19. These factors include political, geographical, and socioeconomic conditions, wealth and resources, quickness and firmness of adhesion to recommended healthcare measures, and the timing of vaccination.

The project used the public dataset from Our World in Data's COVID reports. One initial point of interest is that in this dataset, North America encompasses all of North and Central America, which, for example, lowers its average GDP per capita calculation.

The observations found that while a higher share of elderly (65+ years old) or a higher percentage of smokers among the population can affect the rate of infection and the severity of the disease, it is not what mostly kills. In comparison, there is a visible relation between a smaller average GDP per capita and a higher average mortality rate.

View 1 shows that when swapping average new deaths for average new deaths per million, Brazil peaked the highest among chosen countries for the view. Nigeria's nearly flat line in View 1 and Africa's overall small bubble size in page 2, View 1, and View 2 are inaccurate due to the socioeconomic conditions and the likely massive underreporting of cases and deaths.

Meanwhile, Oceania has a relatively high average infection rate and a tiny average mortality rate. This is likely due to it being a complex of islands with a thinner influx of tourists and immigrants, plus Australia and New Zealand's quick response to the outbreak and firmness in enforcing healthcare measures.

View 4 shows that in July/2021, Europe had, on average, a significantly higher average of its populations vaccinated when compared to Asia, South America, and especially Africa. This further increased the difference of mortality rates, as poor countries with little access to important resources suffered heavily from the successive COVID waves, including Delta at the time of reference.

In conclusion, this project demonstrates the use of PowerBI in analyzing COVID-19 data to gain insights into various factors that impact the infection and mortality rates of COVID-19. These insights are useful in understanding the impact of socioeconomic factors, among others, and can be used to formulate effective policies to mitigate its effects.
