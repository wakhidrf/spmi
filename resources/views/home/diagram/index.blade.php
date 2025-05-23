@extends('template.HomeView',['title'=>"Diagram Pencapaian"])
@section('content')


    <main id="main">


        <!-- ======= About Us Section ======= -->
        <section>
            <div class="container">

                <div class="section-title">
                    <h2>Diagram Pencapaian</h2>
                    <p>Berikut ini adalah diagram pencapaian nilai asessmen setiap Program Studi di Universitas Gresik
                    </p>
                </div>

                <div class="row">
                    <div class="col">
                        <div class="card">
                            <canvas id="barChart" width="300" height="300"></canvas>
                        </div>
                    </div>
                </div>

            </div>
        </section>
        <!-- End About Us Section -->


    </main>
    <!-- End #main -->
@endsection
@section('script')
    <script src="https://cdn.jsdelivr.net/npm/chart.js@3.7.1/dist/chart.min.js"></script>
    <script>
        const diagram = {
            type: 'bar',
            data: {
                labels: ['Manajemen', 'Akuntansi', 'Ilmu Keperawatan', 'Profesi Ners',
                    'K3', 'Teknik Mesin', 'Teknik Sipil', 'Ilmu Komputer', 'Ilmu Hukum',
                    'Sastra Inggris', 'Administrasi Pendidikan', 'Manajemen Pendidikan'
                ],
                labelsLink: ['/diagram/M', '/diagram/A',
                '/diagram/IKep', '/diagram/Ners',
                '/diagram/K3', '/diagram/TM',
                '/diagram/TS', '/diagram/IKom',
                '/diagram/IH', '/diagram/SI',
                'diagram/AP', '/diagram/MP'
                ],
                datasets: [{
                    label: 'Nilai Assesmen Tercapai',
                    data: [<?= $ass['M'] ?>, <?= $ass['A'] ?>, <?= $ass['IKep'] ?>, <?= $ass['Ners'] ?>,
                        <?= $ass['K3'] ?>, <?= $ass['TM'] ?>, <?= $ass['TS'] ?>, <?= $ass['IKom'] ?>,
                        <?= $ass['IH'] ?>, <?= $ass['SI'] ?>, <?= $ass['AP'] ?>, <?= $ass['MP'] ?>
                    ],
                    backgroundColor: [
                        'rgba(255, 99, 132, 0.2)',
                        'rgba(255, 159, 64, 0.2)',
                        'rgba(255, 205, 86, 0.2)',
                        'rgba(75, 192, 192, 0.2)',
                        'rgba(54, 162, 235, 0.2)',
                        'rgba(153, 102, 255, 0.2)',
                        'rgba(201, 203, 207, 0.2)'
                    ],
                    borderColor: [
                        'rgb(255, 99, 132)',
                        'rgb(255, 159, 64)',
                        'rgb(255, 205, 86)',
                        'rgb(75, 192, 192)',
                        'rgb(54, 162, 235)',
                        'rgb(153, 102, 255)',
                        'rgb(201, 203, 207)'
                    ],
                    borderWidth: 1
                }]
            },
            options: {
                responsive: true,
            }

        }
        const ctx = document.getElementById('barChart');
        const myChart = new Chart(ctx, diagram);

        function clickableScale(canvas, click) {

            const height = myChart.scales.x.height
            const top = myChart.scales.x.top
            const bottom = myChart.scales.x.bottom
            const left = myChart.scales.x.left
            const right = myChart.scales.x.maxWidth / myChart.scales.x.ticks.length
            const DIFF = right + left

            // console.log(right);
            let resetCoordinates = canvas.getBoundingClientRect()

            const x = click.clientX - resetCoordinates.left;
            const y = click.clientY - resetCoordinates.top;
            // console.log(x);


            for (let i = 0; i < myChart.scales.x.ticks.length; i++) {

                if (x >= left + (right * i) && x <= DIFF + (right * i) && y >= top && y <= bottom) {
                    // console.log(i);
                    window.open(myChart.config.data.labelsLink[i])
                }
            }
        }

        ctx.addEventListener('click', (e) => {
            clickableScale(ctx, e)
            myChart.resize();
            myChart.update();
        })
    </script>

@endsection
