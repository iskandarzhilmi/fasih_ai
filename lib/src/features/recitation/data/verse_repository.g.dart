// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'verse_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$versesRepositoryHash() => r'1522e8f7e071664798a06101710accd7500e49c3';

/// See also [versesRepository].
@ProviderFor(versesRepository)
final versesRepositoryProvider =
    AutoDisposeProvider<FakeVersesRepository>.internal(
  versesRepository,
  name: r'versesRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$versesRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef VersesRepositoryRef = AutoDisposeProviderRef<FakeVersesRepository>;
String _$versesListStreamHash() => r'611e128f7f83c966a98f00e12c0aa29a846d25ff';

/// See also [versesListStream].
@ProviderFor(versesListStream)
final versesListStreamProvider =
    AutoDisposeStreamProvider<List<Verse>>.internal(
  versesListStream,
  name: r'versesListStreamProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$versesListStreamHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef VersesListStreamRef = AutoDisposeStreamProviderRef<List<Verse>>;
String _$versesListFutureHash() => r'307e7f0f3542f99e001b4e4a1e5f397c52798bc0';

/// See also [versesListFuture].
@ProviderFor(versesListFuture)
final versesListFutureProvider =
    AutoDisposeFutureProvider<List<Verse>>.internal(
  versesListFuture,
  name: r'versesListFutureProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$versesListFutureHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef VersesListFutureRef = AutoDisposeFutureProviderRef<List<Verse>>;
String _$verseHash() => r'1f1a866c8f4741234e4029e6a9310d77bb0fa8dd';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

typedef VerseRef = AutoDisposeStreamProviderRef<Verse?>;

/// See also [verse].
@ProviderFor(verse)
const verseProvider = VerseFamily();

/// See also [verse].
class VerseFamily extends Family<AsyncValue<Verse?>> {
  /// See also [verse].
  const VerseFamily();

  /// See also [verse].
  VerseProvider call(
    String id,
  ) {
    return VerseProvider(
      id,
    );
  }

  @override
  VerseProvider getProviderOverride(
    covariant VerseProvider provider,
  ) {
    return call(
      provider.id,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'verseProvider';
}

/// See also [verse].
class VerseProvider extends AutoDisposeStreamProvider<Verse?> {
  /// See also [verse].
  VerseProvider(
    this.id,
  ) : super.internal(
          (ref) => verse(
            ref,
            id,
          ),
          from: verseProvider,
          name: r'verseProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$verseHash,
          dependencies: VerseFamily._dependencies,
          allTransitiveDependencies: VerseFamily._allTransitiveDependencies,
        );

  final String id;

  @override
  bool operator ==(Object other) {
    return other is VerseProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
