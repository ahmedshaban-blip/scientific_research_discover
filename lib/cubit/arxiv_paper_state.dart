import 'package:equatable/equatable.dart';
import 'package:scientific_research_discover/Data/arxivmodel.dart';

abstract class ArxivPaperState extends Equatable {
  const ArxivPaperState();

  @override
  List<Object> get props => [];
}

class ArxivPaperInitial extends ArxivPaperState {}

class ArxivPaperLoading extends ArxivPaperState {}

class ArxivPaperLoaded extends ArxivPaperState {
  final List<ArxivPaper> papers;

  const ArxivPaperLoaded({required this.papers});

  @override
  List<Object> get props => [papers];
}

class ArxivPaperError extends ArxivPaperState {
  final String message;

  const ArxivPaperError({required this.message});

  @override
  List<Object> get props => [message];
}
