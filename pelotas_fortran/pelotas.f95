program arquivo
    implicit none  ! Evita a declaração implícita de variáveis, exigindo que todas sejam declaradas explicitamente

    ! Declaração de variáveis
    integer :: nl, ind1, ind2            ! Contadores e índices para menor e maior temperatura
    character(len=7) :: y1, y2, y3       ! Variáveis para ler cabeçalho (nomes das colunas, por exemplo)
    integer, dimension(36) :: ano        ! Vetor para armazenar os anos (36 anos)
    real, dimension(36) :: tmin, tmax    ! Vetores para armazenar temperaturas mínimas e máximas
    real :: soma1, soma2, menor, maior   ! Variáveis auxiliares para soma e extremos de temperatura

    ! Abre o arquivo de texto "pelotas.txt" para leitura (unit 10 é um identificador interno)
    open(unit=10, file="pelotas.txt", action="read")

    ! Lê a primeira linha do arquivo (assumidamente o cabeçalho, ignorado aqui)
    read(10,*) y1, y2, y3

    ! Loop para ler os dados do arquivo: ano, temperatura mínima e máxima
    do nl = 1, 36
        read(10,*) ano(nl), tmin(nl), tmax(nl)
    end do

    ! Fecha o arquivo após leitura
    close(unit=10)

    ! Exibe todos os dados lidos (útil para verificação)
    write(*,*) ano, tmin, tmax
    write(*,*) "************************************************"

    ! Inicializa variáveis para soma de temperaturas
    soma1 = 0.0
    soma2 = 0.0

    ! Inicializa menor e maior temperatura com o primeiro valor do vetor
    menor = tmin(1)
    maior = tmax(1)

    ! Loop para calcular soma das temperaturas, bem como identificar menor tmin e maior tmax
    do nl = 1, 36
        soma1 = soma1 + tmin(nl)
        soma2 = soma2 + tmax(nl)

        ! Atualiza menor temperatura mínima
        if (tmin(nl) < menor) then
            menor = tmin(nl)
            ind1 = nl   ! Guarda o índice do menor valor
        end if

        ! Atualiza maior temperatura máxima
        if (tmax(nl) > maior) then
            maior = tmax(nl)
            ind2 = nl   ! Guarda o índice do maior valor
        end if
    end do

    ! Imprime os resultados: médias, extremos e anos correspondentes
    write(*,*) "Media Minima:", soma1 / 36.0
    write(*,*) "Menor Minima:", menor
    write(*,*) "Ano da Minima:", ano(ind1)
    write(*,*) "Media Maxima:", soma2 / 36.0
    write(*,*) "Maior Maxima:", maior
    write(*,*) "Ano da Maxima:", ano(ind2)

end program arquivo

