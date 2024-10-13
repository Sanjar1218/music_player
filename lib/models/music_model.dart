import 'dart:typed_data';

import 'package:music_player/core/functions/pare_integer.dart';

class MusicModel {
  /// Name of the track.
  final String? trackName;

  /// Names of the artists performing in the track.
  final List<String>? trackArtistNames;

  /// Name of the album.
  final String? albumName;

  /// Name of the album artist.
  final String? albumArtistName;

  /// Position of track in the album.
  final int? trackNumber;

  /// Number of tracks in the album.
  final int? albumLength;

  /// Year of the track.
  final int? year;

  /// Genre of the track.
  final String? genre;

  /// Author of the track.
  final String? authorName;

  /// Writer of the track.
  final String? writerName;

  /// Number of the disc.
  final int? discNumber;

  /// Mime type.
  final String? mimeType;

  /// Duration of the track in milliseconds.
  final int? trackDuration;

  /// Bitrate of the track.
  final int? bitrate;

  /// [Uint8List] having album art data.
  final Uint8List? albumArt;

  /// File path of the media file. `null` on web.
  final String? filePath;

  /// Url from internet
  final String? url;

  const MusicModel({
    this.url,
    this.trackName,
    this.trackArtistNames,
    this.albumName,
    this.albumArtistName,
    this.trackNumber,
    this.albumLength,
    this.year,
    this.genre,
    this.authorName,
    this.writerName,
    this.discNumber,
    this.mimeType,
    this.trackDuration,
    this.bitrate,
    this.albumArt,
    this.filePath,
  });

  // method to convert metadata to music model
  factory MusicModel.fromMetadata(dynamic metadata) => MusicModel(
        trackName: metadata.trackName,
        trackArtistNames: metadata.trackArtistNames,
        albumName: metadata.albumName,
        albumArtistName: metadata.albumArtistName,
        trackNumber: metadata.trackNumber,
        albumLength: metadata.albumLength,
        year: metadata.year,
        genre: metadata.genre,
        authorName: metadata.authorName,
        writerName: metadata.writerName,
        discNumber: metadata.discNumber,
        mimeType: metadata.mimeType,
        trackDuration: metadata.trackDuration,
        bitrate: metadata.bitrate,
        albumArt: metadata.albumArt,
        filePath: metadata.filePath,
      );

  factory MusicModel.fromJson(dynamic map) => MusicModel(
        url: map['url'],
        trackName: map['metadata']['trackName'],
        trackArtistNames: map['metadata']['trackArtistNames']?.split('/'),
        albumName: map['metadata']['albumName'],
        albumArtistName: map['metadata']['albumArtistName'],
        trackNumber: parseInteger(map['metadata']['trackNumber']),
        albumLength: parseInteger(map['metadata']['albumLength']),
        year: parseInteger(map['metadata']['year']),
        genre: map['genre'],
        authorName: map['metadata']['authorName'],
        writerName: map['metadata']['writerName'],
        discNumber: parseInteger(map['metadata']['discNumber']),
        mimeType: map['metadata']['mimeType'],
        trackDuration: parseInteger(map['metadata']['trackDuration']),
        bitrate: parseInteger(map['metadata']['bitrate']),
        albumArt: map['albumArt'],
        filePath: map['filePath'],
      );

  Map<String, dynamic> toJson() => {
        'url': url,
        'trackName': trackName,
        'trackArtistNames': trackArtistNames,
        'albumName': albumName,
        'albumArtistName': albumArtistName,
        'trackNumber': trackNumber,
        'albumLength': albumLength,
        'year': year,
        'genre': genre,
        'authorName': authorName,
        'writerName': writerName,
        'discNumber': discNumber,
        'mimeType': mimeType,
        'trackDuration': trackDuration,
        'bitrate': bitrate,
        'filePath': filePath,
      };

  @override
  String toString() => toJson().toString();
}
