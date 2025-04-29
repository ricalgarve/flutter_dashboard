import 'package:flutter/material.dart';

enum DashboardItem {
  temperatura,
  usuariosAtivos,
  relatorios,
  notificacoes,
}

extension DashboardItemExtension on DashboardItem {
  String get label {
    switch (this) {
      case DashboardItem.temperatura:
        return 'Temperatura';
      case DashboardItem.usuariosAtivos:
        return 'Usuários Ativos';
      case DashboardItem.relatorios:
        return 'Relatórios';
      case DashboardItem.notificacoes:
        return 'Notificações';
    }
  }
}

class HomeScreen extends StatefulWidget {
  final VoidCallback onToggleTheme;

  const HomeScreen({super.key, required this.onToggleTheme});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  bool _isRefreshingAll = false;

  Map<DashboardItem, String> dashboardData = {
    DashboardItem.temperatura: '28°C',
    DashboardItem.usuariosAtivos: '124',
    DashboardItem.relatorios: '8 Novos',
    DashboardItem.notificacoes: '5',
  };

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void _refreshAll() async {
    setState(() {
      _isRefreshingAll = true;
    });

    await Future.delayed(const Duration(seconds: 2));

    setState(() {
      dashboardData = {
        DashboardItem.temperatura: '40°C',
        DashboardItem.usuariosAtivos: '130',
        DashboardItem.relatorios: '2 Novos',
        DashboardItem.notificacoes: '6',
      };
      _isRefreshingAll = false;
    });

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Atualização finalizada.')),
    );
  }

  Future<String> _refreshCard(DashboardItem item) async {
    await Future.delayed(const Duration(milliseconds: 500));
    switch (item) {
      case DashboardItem.temperatura:
        return '${24 + (5 - 3)}°C';
      case DashboardItem.usuariosAtivos:
        return '130';
      case DashboardItem.relatorios:
        return '2 Novos';
      case DashboardItem.notificacoes:
        return '6';
    }
  }

  List<Widget> buildDashboardItems() {
    return [
      DashboardCard(
        label: DashboardItem.temperatura.label,
        value: dashboardData[DashboardItem.temperatura]!,
        icon: Icons.thermostat,
        onRefresh: () async {
          final newValue = await _refreshCard(DashboardItem.temperatura);
          setState(() {
            dashboardData[DashboardItem.temperatura] = newValue;
          });
          return newValue;
        },
      ),
      DashboardCard(
        label: DashboardItem.usuariosAtivos.label,
        value: dashboardData[DashboardItem.usuariosAtivos]!,
        icon: Icons.person,
        onRefresh: () async {
          final newValue = await _refreshCard(DashboardItem.usuariosAtivos);
          setState(() {
            dashboardData[DashboardItem.usuariosAtivos] = newValue;
          });
          return newValue;
        },
      ),
      DashboardCard(
        label: DashboardItem.relatorios.label,
        value: dashboardData[DashboardItem.relatorios]!,
        icon: Icons.bar_chart,
        onRefresh: () async {
          final newValue = await _refreshCard(DashboardItem.relatorios);
          setState(() {
            dashboardData[DashboardItem.relatorios] = newValue;
          });
          return newValue;
        },
      ),
      DashboardCard(
        label: DashboardItem.notificacoes.label,
        value: dashboardData[DashboardItem.notificacoes]!,
        icon: Icons.notifications,
        onRefresh: () async {
          final newValue = await _refreshCard(DashboardItem.notificacoes);
          setState(() {
            dashboardData[DashboardItem.notificacoes] = newValue;
          });
          return newValue;
        },
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text(
          'Dashboard',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
        centerTitle: true,
        backgroundColor: colorScheme.primary,   // cor do fundo
        foregroundColor: colorScheme.onPrimary, // cor dos ícones e textos
        elevation: 4,
        actions: [
          IconButton(
            icon: Icon(Icons.brightness_6),
            onPressed: widget.onToggleTheme,
            tooltip: 'Alternar tema',
          ),
        ],
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(icon: Icon(Icons.dashboard), text: 'Resumo'),
            Tab(icon: Icon(Icons.person), text: 'Usuários'),
            Tab(icon: Icon(Icons.bar_chart), text: 'Relatórios'),
            Tab(icon: Icon(Icons.notifications), text: 'Notificações'),
          ],
          indicatorColor: colorScheme.onPrimary,
          labelColor: colorScheme.onPrimary,
          unselectedLabelColor: colorScheme.onPrimary.withValues(alpha: 0.7),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildDashboardGrid(),
          _buildSimpleText('Lista de Usuários'),
          _buildSimpleText('Relatórios Recentes'),
          _buildSimpleText('Notificações Recebidas'),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _isRefreshingAll ? null : _refreshAll,
        child: _isRefreshingAll
            ? const CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                strokeWidth: 2,
              )
            : const Icon(Icons.refresh),
      ),
    );
  }

  Widget _buildDashboardGrid() {
    final colorScheme = Theme.of(context).colorScheme;
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            colorScheme.primary.withValues(alpha: 0.8),
            colorScheme.secondary.withValues(alpha:0.8),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: kToolbarHeight, left: 16, right: 16),
        child: GridView.count(
          crossAxisCount: _getCrossAxisCount(context),
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          children: buildDashboardItems(),
        ),
      ),
    );
  }

  Widget _buildSimpleText(String text) {
    return Center(
      child: Text(
        text,
        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
    );
  }

  int _getCrossAxisCount(BuildContext context) {
    if (MediaQuery.of(context).size.width > 1000) {
      return 4;
    } else if (MediaQuery.of(context).size.width > 600) {
      return 3;
    } else {
      return 2;
    }
  }
}

class DashboardCard extends StatefulWidget {
  final String label;
  final String value;
  final IconData icon;
  final Future<String> Function() onRefresh;

  const DashboardCard({
    super.key,
    required this.label,
    required this.value,
    required this.icon,
    required this.onRefresh,
  });

  @override
  State<DashboardCard> createState() => _DashboardCardState();
}

class _DashboardCardState extends State<DashboardCard> {
  bool isLoading = false;

  void _handleRefresh() async {
    setState(() => isLoading = true);
    await widget.onRefresh();
    if (mounted) {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Card(
      elevation: 8,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  widget.icon,
                  size: 40,
                  color: colorScheme.onSurface,
                ),
                const SizedBox(width: 4),
                Opacity(
                  opacity: 0.5,
                  child: IconButton(
                    icon: const Icon(Icons.refresh, size: 18),
                    onPressed: _handleRefresh,
                    tooltip: 'Atualizar ${widget.label}',
                    splashRadius: 20,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              widget.label,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: colorScheme.onSecondary,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            isLoading
                ? const SizedBox(
                    width: 24,
                    height: 24,
                    child: CircularProgressIndicator(strokeWidth: 2),
                  )
                : Text(
                    widget.value,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: colorScheme.onSurface,
                    ),
                    textAlign: TextAlign.center,
                  ),
          ],
        ),
      ),
    );
  }
}
